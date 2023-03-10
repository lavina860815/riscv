// Copyright 2016 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Package chacha20 implements the ChaCha20 and XChaCha20 encryption algorithms
// as specified in RFC 8439 and draft-irtf-cfrg-xchacha-01.
package chacha20

import (
	"crypto/cipher"
	"encoding/binary"
	"errors"
	"math/bits"

	"golang.org/x/crypto/internal/subtle"
)

const (
	// KeySize is the size of the key used by this cipher, in bytes.
	KeySize = 32

	// NonceSize is the size of the nonce used with the standard variant of this
	// cipher, in bytes.
	//
	// Note that this is too short to be safely generated at random if the same
	// key is reused more than 2³² times.
	NonceSize = 12

	// NonceSizeX is the size of the nonce used with the XChaCha20 variant of
	// this cipher, in bytes.
	NonceSizeX = 24
)

// Cipher is a stateful instance of ChaCha20 or XChaCha20 using a particular key
// and nonce. A *Cipher implements the cipher.Stream interface.
type Cipher struct {
	// The ChaCha20 state is 16 words: 4 constant, 8 of key, 1 of counter
	// (incremented after each block), and 3 of nonce.
	key     [8]uint32
	counter uint32
	nonce   [3]uint32

	// The last len bytes of buf are leftover key stream bytes from the previous
	// XORKeyStream invocation. The size of buf depends on how many blocks are
	// computed at a time.
	buf [bufSize]byte
	len int

	// The counter-independent results of the first round are cached after they
	// are computed the first time.
	precompDone      bool
	p1, p5, p9, p13  uint32
	p2, p6, p10, p14 uint32
	p3, p7, p11, p15 uint32
}

var _ cipher.Stream = (*Cipher)(nil)

// NewUnauthenticatedCipher creates a new ChaCha20 stream cipher with the given
// 32 bytes key and a 12 or 24 bytes nonce. If a nonce of 24 bytes is provided,
// the XChaCha20 construction will be used. It returns an error if key or nonce
// have any other length.
//
// Note that ChaCha20, like all stream ciphers, is not authenticated and allows
// attackers to silently tamper with the plaintext. For this reason, it is more
// appropriate as a building block than as a standalone encryption mechanism.
// Instead, consider using package golang.org/x/crypto/chacha20poly1305.
func NewUnauthenticatedCipher(key, nonce []byte) (*Cipher, error) {
	// This function is split into a wrapper so that the Cipher allocation will
	// be inlined, and depending on how the caller uses the return value, won't
	// escape to the heap.
	c := &Cipher{}
	return newUnauthenticatedCipher(c, key, nonce)
}

func newUnauthenticatedCipher(c *Cipher, key, nonce []byte) (*Cipher, error) {
	if len(key) != KeySize {
		return nil, errors.New("chacha20: wrong key size")
	}
	if len(nonce) == NonceSizeX {
		// XChaCha20 uses the ChaCha20 core to mix 16 bytes of the nonce into a
		// derived key, allowing it to operate on a nonce of 24 bytes. See
		// draft-irtf-cfrg-xchacha-01, Section 2.3.
		key, _ = HChaCha20(key, nonce[0:16])
		cNonce := make([]byte, NonceSize)
		copy(cNonce[4:12], nonce[16:24])
		nonce = cNonce
	} else if len(nonce) != NonceSize {
		return nil, errors.New("chacha20: wrong nonce size")
	}

	c.key = [8]uint32{
		binary.LittleEndian.Uint32(key[0:4]),
		binary.LittleEndian.Uint32(key[4:8]),
		binary.LittleEndian.Uint32(key[8:12]),
		binary.LittleEndian.Uint32(key[12:16]),
		binary.LittleEndian.Uint32(key[16:20]),
		binary.LittleEndian.Uint32(key[20:24]),
		binary.LittleEndian.Uint32(key[24:28]),
		binary.LittleEndian.Uint32(key[28:32]),
	}
	c.nonce = [3]uint32{
		binary.LittleEndian.Uint32(nonce[0:4]),
		binary.LittleEndian.Uint32(nonce[4:8]),
		binary.LittleEndian.Uint32(nonce[8:12]),
	}
	return c, nil
}

// The constant first 4 words of the ChaCha20 state.
const (
	j0 uint32 = 0x61707865 // expa
	j1 uint32 = 0x3320646e // nd 3
	j2 uint32 = 0x79622d32 // 2-by
	j3 uint32 = 0x6b206574 // te k
)

const blockSize = 64

// quarterRound is the core of ChaCha20. It shuffles the bits of 4 state words.
// It's executed 4 times for each of the 20 ChaCha20 rounds, operating on all 16
// words each round, in columnar or diagonal groups of 4 at a time.
func quarterRound(a, b, c, d uint32) (uint32, uint32, uint32, uint32) {
	a += b
	d ^= a
	d = bits.RotateLeft32(d, 16)
	c += d
	b ^= c
	b = bits.RotateLeft32(b, 12)
	a += b
	d ^= a
	d = bits.RotateLeft32(d, 8)
	c += d
	b ^= c
	b = bits.RotateLeft32(b, 7)
	return a, b, c, d
}

// XORKeyStream XORs each byte in the given slice with a byte from the
// cipher's key stream. Dst and src must overlap entirely or not at all.
//
// If len(dst) < len(src), XORKeyStream will panic. It is acceptable
// to pass a dst bigger than src, and in that case, XORKeyStream will
// only update dst[:len(src)] and will not touch the rest of dst.
//
// Multiple calls to XORKeyStream behave as if the concatenation of
// the src buffers was passed in a single run. That is, Cipher
// maintains state and does not reset at each XORKeyStream call.
func (s *Cipher) XORKeyStream(dst, src []byte) {
	if len(src) == 0 {
		return
	}
	if len(dst) < len(src) {
		panic("chacha20: output smaller than input")
	}
	dst = dst[:len(src)]
	if subtle.InexactOverlap(dst, src) {
		panic("chacha20: invalid buffer overlap")
	}

	// First, drain any remaining key stream from a previous XORKeyStream.
	if s.len != 0 {
		keyStream := s.buf[bufSize-s.len:]
		if len(src) < len(keyStream) {
			keyStream = keyStream[:len(src)]
		}
		_ = src[len(keyStream)-1] // bounds check elimination hint
		for i, b := range keyStream {
			dst[i] = src[i] ^ b
		}
		s.len -= len(keyStream)
		src = src[len(keyStream):]
		dst = dst[len(keyStream):]
	}

	const blocksPerBuf = bufSize / blockSize
	numBufs := (uint64(len(src)) + bufSize - 1) / bufSize
	if uint64(s.counter)+numBufs*blocksPerBuf >= 1<<32 {
		panic("chacha20: counter overflow")
	}

	// xorKeyStreamBlocks implementations expect input lengths that are a
	// multiple of bufSize. Platform-specific ones process multiple blocks at a
	// time, so have bufSizes that are a multiple of blockSize.

	rem := len(src) % bufSize
	full := len(src) - rem

	if full > 0 {
		s.xorKeyStreamBlocks(dst[:full], src[:full])
	}

	// If we have a partial (multi-)block, pad it for xorKeyStreamBlocks, and
	// keep the leftover keystream for the next XORKeyStream invocation.
	if rem > 0 {
		s.buf = [bufSize]byte{}
		copy(s.buf[:], src[full:])
		s.xorKeyStreamBlocks(s.buf[:], s.buf[:])
		s.len = bufSize - copy(dst[full:], s.buf[:])
	}
}

func (s *Cipher) xorKeyStreamBlocksGeneric(dst, src []byte) {
	if len(dst) != len(src) || len(dst)%blockSize != 0 {
		panic("chacha20: internal error: wrong dst and/or src length")
	}

	// To generate each block of key stream, the initial cipher state
	// (represented below) is passed through 20 rounds of shuffling,
	// alternatively applying quarterRounds by columns (like 1, 5, 9, 13)
	// or by diagonals (like 1, 6, 11, 12).
	//
	//      0:cccccccc   1:cccccccc   2:cccccccc   3:cccccccc
	//      4:kkkkkkkk   5:kkkkkkkk   6:kkkkkkkk   7:kkkkkkkk
	//      8:kkkkkkkk   9:kkkkkkkk  10:kkkkkkkk  11:kkkkkkkk
	//     12:bbbbbbbb  13:nnnnnnnn  14:nnnnnnnn  15:nnnnnnnn
	//
	//            c=constant k=key b=blockcount n=nonce
	var (
		c0, c1, c2, c3   = j0, j1, j2, j3
		c4, c5, c6, c7   = s.key[0], s.key[1], s.key[2], s.key[3]
		c8, c9, c10, c11 = s.key[4], s.key[5], s.key[6], s.key[7]
		_, c13, c14, c15 = s.counter, s.nonce[0], s.nonce[1], s.nonce[2]
	)

	// Three quarters of the first round don't depend on the counter, so we can
	// calculate them here, and reuse them for multiple blocks in the loop, and
	// for future XORKeyStream invocations.
	if !s.precompDone {
		s.p1, s.p5, s.p9, s.p13 = quarterRound(c1, c5, c9, c13)
		s.p2, s.p6, s.p10, s.p14 = quarterRound(c2, c6, c10, c14)
		s.p3, s.p7, s.p11, s.p15 = quarterRound(c3, c7, c11, c15)
		s.precompDone = true
	}

	for i := 0; i < len(src); i += blockSize {
		// The remainder of the first column round.
		fcr0, fcr4, fcr8, fcr12 := quarterRound(c0, c4, c8, s.counter)

		// The second diagonal round.
		x0, x5, x10, x15 := quarterRound(fcr0, s.p5, s.p10, s.p15)
		x1, x6, x11, x12 := quarterRound(s.p1, s.p6, s.p11, fcr12)
		x2, x7, x8, x13 := quarterRound(s.p2, s.p7, fcr8, s.p13)
		x3, x4, x9, x14 := quarterRound(s.p3, fcr4, s.p9, s.p14)

		// The remaining 18 rounds.
		for i := 0; i < 9; i++ {
			// Column round.
			x0, x4, x8, x12 = quarterRound(x0, x4, x8, x12)
			x1, x5, x9, x13 = quarterRound(x1, x5, x9, x13)
			x2, x6, x10, x14 = quarterRound(x2, x6, x10, x14)
			x3, x7, x11, x15 = quarterRound(x3, x7, x11, x15)

			// Diagonal round.
			x0, x5, x10, x15 = quarterRound(x0, x5, x10, x15)
			x1, x6, x11, x12 = quarterRound(x1, x6, x11, x12)
			x2, x7, x8, x13 = quarterRound(x2, x7, x8, x13)
			x3, x4, x9, x14 = quarterRound(x3, x4, x9, x14)
		}

		// Finally, add back the initial state to generate the key stream.
		x0 += c0
		x1 += c1
		x2 += c2
		x3 += c3
		x4 += c4
		x5 += c5
		x6 += c6
		x7 += c7
		x8 += c8
		x9 += c9
		x10 += c10
		x11 += c11
		x12 += s.counter
		x13 += c13
		x14 += c14
		x15 += c15

		s.counter += 1
		if s.counter == 0 {
			panic("chacha20: internal error: counter overflow")
		}

		in, out := src[i:], dst[i:]
		in, out = in[:blockSize], out[:blockSize] // bounds check elimination hint

		// XOR the key stream with the source and write out the result.
		xor(out[0:], in[0:], x0)
		xor(out[4:], in[4:], x1)
		xor(out[8:], in[8:], x2)
		xor(out[12:], in[12:], x3)
		xor(out[16:], in[16:], x4)
		xor(out[20:], in[20:], x5)
		xor(out[24:], in[24:], x6)
		xor(out[28:], in[28:], x7)
		xor(out[32:], in[32:], x8)
		xor(out[36:], in[36:], x9)
		xor(out[40:], in[40:], x10)
		xor(out[44:], in[44:], x11)
		xor(out[48:], in[48:], x12)
		xor(out[52:], in[52:], x13)
		xor(out[56:], in[56:], x14)
		xor(out[60:], in[60:], x15)
	}
}

// HChaCha20 uses the ChaCha20 core to generate a derived key from a 32 bytes
// key and a 16 bytes nonce. It returns an error if key or nonce have any other
// length. It is used as part of the XChaCha20 construction.
func HChaCha20(key, nonce []byte) ([]byte, error) {
	// This function is split into a wrapper so that the slice allocation will
	// be inlined, and depending on how the caller uses the return value, won't
	// escape to the heap.
	out := make([]byte, 32)
	return hChaCha20(out, key, nonce)
}

func hChaCha20(out, key, nonce []byte) ([]byte, error) {
	if len(key) != KeySize {
		return nil, errors.New("chacha20: wrong HChaCha20 key size")
	}
	if len(nonce) != 16 {
		return nil, errors.New("chacha20: wrong HChaCha20 nonce size")
	}

	x0, x1, x2, x3 := j0, j1, j2, j3
	x4 := binary.LittleEndian.Uint32(key[0:4])
	x5 := binary.LittleEndian.Uint32(key[4:8])
	x6 := binary.LittleEndian.Uint32(key[8:12])
	x7 := binary.LittleEndian.Uint32(key[12:16])
	x8 := binary.LittleEndian.Uint32(key[16:20])
	x9 := binary.LittleEndian.Uint32(key[20:24])
	x10 := binary.LittleEndian.Uint32(key[24:28])
	x11 := binary.LittleEndian.Uint32(key[28:32])
	x12 := binary.LittleEndian.Uint32(nonce[0:4])
	x13 := binary.LittleEndian.Uint32(nonce[4:8])
	x14 := binary.LittleEndian.Uint32(nonce[8:12])
	x15 := binary.LittleEndian.Uint32(nonce[12:16])

	for i := 0; i < 10; i++ {
		// Diagonal round.
		x0, x4, x8, x12 = quarterRound(x0, x4, x8, x12)
		x1, x5, x9, x13 = quarterRound(x1, x5, x9, x13)
		x2, x6, x10, x14 = quarterRound(x2, x6, x10, x14)
		x3, x7, x11, x15 = quarterRound(x3, x7, x11, x15)

		// Column round.
		x0, x5, x10, x15 = quarterRound(x0, x5, x10, x15)
		x1, x6, x11, x12 = quarterRound(x1, x6, x11, x12)
		x2, x7, x8, x13 = quarterRound(x2, x7, x8, x13)
		x3, x4, x9, x14 = quarterRound(x3, x4, x9, x14)
	}

	_ = out[31] // bounds check elimination hint
	binary.LittleEndian.PutUint32(out[0:4], x0)
	binary.LittleEndian.PutUint32(out[4:8], x1)
	binary.LittleEndian.PutUint32(out[8:12], x2)
	binary.LittleEndian.PutUint32(out[12:16], x3)
	binary.LittleEndian.PutUint32(out[16:20], x12)
	binary.LittleEndian.PutUint32(out[20:24], x13)
	binary.LittleEndian.PutUint32(out[24:28], x14)
	binary.LittleEndian.PutUint32(out[28:32], x15)
	return out, nil
}
