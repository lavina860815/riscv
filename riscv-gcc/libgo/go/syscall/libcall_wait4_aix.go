// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Handle AIX's wait4 specific behavior

package syscall

//sys  wait4(pid Pid_t, status *_C_int, options int, rusage *Rusage) (wpid Pid_t, err error)
//wait4(pid Pid_t, status *_C_int, options _C_int, rusage *Rusage) Pid_t

func Wait4(pid int, wstatus *WaitStatus, options int, rusage *Rusage) (wpid int, err error) {
	var status _C_int
	var r Pid_t
	err = ERESTART
	// AIX wait4 may return with ERESTART errno, while the processus is still
	// active.
	for err == ERESTART {
		r, err = wait4(Pid_t(pid), &status, options, rusage)
	}
	wpid = int(r)
	if wstatus != nil {
		*wstatus = WaitStatus(status)
	}
	return
}
