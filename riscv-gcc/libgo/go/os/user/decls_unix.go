// Copyright 2014 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build darwin dragonfly freebsd hurd linux netbsd openbsd
// +build cgo

package user

import "syscall"

// Declarations for the libc functions on most Unix systems.

//extern getpwnam_r
func libc_getpwnam_r(name *byte, pwd *syscall.Passwd, buf *byte, buflen syscall.Size_t, result **syscall.Passwd) int

//extern getpwuid_r
func libc_getpwuid_r(uid syscall.Uid_t, pwd *syscall.Passwd, buf *byte, buflen syscall.Size_t, result **syscall.Passwd) int

//extern getgrnam_r
func libc_getgrnam_r(name *byte, grp *syscall.Group, buf *byte, buflen syscall.Size_t, result **syscall.Group) int

//extern getgrgid_r
func libc_getgrgid_r(gid syscall.Gid_t, grp *syscall.Group, buf *byte, buflen syscall.Size_t, result **syscall.Group) int

//extern getgrouplist
func libc_getgrouplist(user *byte, group syscall.Gid_t, groups *syscall.Gid_t, ngroups *int32) int
