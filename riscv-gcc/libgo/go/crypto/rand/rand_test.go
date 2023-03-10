// Copyright 2010 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package rand

import (
	"bytes"
	"compress/flate"
	"io"
	"testing"
)

func TestRead(t *testing.T) {
	var n int = 4e6
	if testing.Short() {
		n = 1e5
	}
	b := make([]byte, n)
	n, err := io.ReadFull(Reader, b)
	if n != len(b) || err != nil {
		t.Fatalf("ReadFull(buf) = %d, %s", n, err)
	}

	var z bytes.Buffer
	f, _ := flate.NewWriter(&z, 5)
	f.Write(b)
	f.Close()
	if z.Len() < len(b)*99/100 {
		t.Fatalf("Compressed %d -> %d", len(b), z.Len())
	}
}

func TestReadEmpty(t *testing.T) {
	n, err := Reader.Read(make([]byte, 0))
	if n != 0 || err != nil {
		t.Fatalf("Read(make([]byte, 0)) = %d, %v", n, err)
	}
	n, err = Reader.Read(nil)
	if n != 0 || err != nil {
		t.Fatalf("Read(nil) = %d, %v", n, err)
	}
}
