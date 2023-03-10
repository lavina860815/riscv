// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package os

import (
	"io"
	"runtime"
	"sync/atomic"
	"syscall"
	"unsafe"
)

// FIXME: pathconf returns long, not int.
//extern pathconf
func libc_pathconf(*byte, int32) int

//extern dup
func libc_dup(int32) int32

func clen(n []byte) int {
	for i := 0; i < len(n); i++ {
		if n[i] == 0 {
			return i
		}
	}
	return len(n)
}

var nameMax int32

func (file *File) readdirnames(n int) (names []string, err error) {
	if file.dirinfo == nil {
		p, err := syscall.BytePtrFromString(file.name)
		if err != nil {
			return nil, err
		}

		elen := int(atomic.LoadInt32(&nameMax))
		if elen == 0 {
			syscall.Entersyscall()
			plen := libc_pathconf(p, syscall.PC_NAME_MAX)
			syscall.Exitsyscall()
			if plen < 1024 {
				plen = 1024
			}
			var dummy syscall.Dirent
			elen = int(unsafe.Offsetof(dummy.Name)) + plen + 1
			atomic.StoreInt32(&nameMax, int32(elen))
		}

		syscall.Entersyscall()
		fd := libc_dup(int32(file.pfd.Sysfd))
		errno := syscall.GetErrno()
		syscall.Exitsyscall()
		if fd < 0 {
			return nil, &PathError{"dup", file.name, errno}
		}

		syscall.Entersyscall()
		r := libc_fdopendir(fd)
		errno = syscall.GetErrno()
		syscall.Exitsyscall()
		if r == nil {
			return nil, &PathError{"fdopendir", file.name, errno}
		}

		file.dirinfo = new(dirInfo)
		file.dirinfo.buf = make([]byte, elen)
		file.dirinfo.dir = r
	}

	entryDirent := (*syscall.Dirent)(unsafe.Pointer(&file.dirinfo.buf[0]))

	size := n
	if size <= 0 {
		size = 100
		n = -1
	}

	names = make([]string, 0, size) // Empty with room to grow.

	for n != 0 {
		var dirent *syscall.Dirent
		pr := &dirent
		syscall.Entersyscall()
		i := libc_readdir_r(file.dirinfo.dir, entryDirent, pr)
		syscall.Exitsyscall()
		// On AIX when readdir_r hits EOF it sets dirent to nil and returns 9.
		//  https://www.ibm.com/support/knowledgecenter/ssw_aix_71/com.ibm.aix.basetrf2/readdir_r.htm
		if runtime.GOOS == "aix" && i == 9 && dirent == nil {
			break
		}
		if i != 0 {
			return names, NewSyscallError("readdir_r", i)
		}
		if dirent == nil {
			break // EOF
		}
		bytes := (*[10000]byte)(unsafe.Pointer(&dirent.Name[0]))
		var name = string(bytes[0:clen(bytes[:])])
		if name == "." || name == ".." { // Useless names
			continue
		}
		names = append(names, name)
		n--
	}
	if n >= 0 && len(names) == 0 {
		return names, io.EOF
	}
	return names, nil
}

func (f *File) seekInvalidate() {
	if f.file.dirinfo != nil {
		syscall.Entersyscall()
		libc_closedir(f.file.dirinfo.dir)
		syscall.Exitsyscall()
		f.file.dirinfo = nil
	}
}
