/* Native-dependent code for FreeBSD/i386.

   Copyright (C) 2001-2020 Free Software Foundation, Inc.

   This file is part of GDB.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

#include "defs.h"
#include "inferior.h"
#include "regcache.h"
#include "target.h"

#include <sys/types.h>
#include <sys/ptrace.h>
#include <sys/sysctl.h>
#include <sys/user.h>

#include "fbsd-nat.h"
#include "i386-tdep.h"
#include "x86-nat.h"
#include "gdbsupport/x86-xstate.h"
#include "x86-bsd-nat.h"
#include "i386-bsd-nat.h"

class i386_fbsd_nat_target final
  : public i386_bsd_nat_target<fbsd_nat_target>
{
public:
  /* Add some extra features to the common *BSD/i386 target.  */
#ifdef PT_GETXSTATE_INFO
  const struct target_desc *read_description () override;
#endif

  void resume (ptid_t, int, enum gdb_signal) override;

#if defined(HAVE_PT_GETDBREGS) && defined(USE_SIGTRAP_SIGINFO)
  bool supports_stopped_by_hw_breakpoint () override;
#endif
};

static i386_fbsd_nat_target the_i386_fbsd_nat_target;

/* Resume execution of the inferior process.  If STEP is nonzero,
   single-step it.  If SIGNAL is nonzero, give it that signal.  */

void
i386_fbsd_nat_target::resume (ptid_t ptid, int step, enum gdb_signal signal)
{
  pid_t pid = ptid.pid ();
  int request = PT_STEP;

  if (pid == -1)
    /* Resume all threads.  This only gets used in the non-threaded
       case, where "resume all threads" and "resume inferior_ptid" are
       the same.  */
    pid = inferior_ptid.pid ();

  if (!step)
    {
      struct regcache *regcache = get_current_regcache ();
      ULONGEST eflags;

      /* Workaround for a bug in FreeBSD.  Make sure that the trace
 	 flag is off when doing a continue.  There is a code path
 	 through the kernel which leaves the flag set when it should
 	 have been cleared.  If a process has a signal pending (such
 	 as SIGALRM) and we do a PT_STEP, the process never really has
 	 a chance to run because the kernel needs to notify the
 	 debugger that a signal is being sent.  Therefore, the process
 	 never goes through the kernel's trap() function which would
 	 normally clear it.  */

      regcache_cooked_read_unsigned (regcache, I386_EFLAGS_REGNUM,
				     &eflags);
      if (eflags & 0x0100)
	regcache_cooked_write_unsigned (regcache, I386_EFLAGS_REGNUM,
					eflags & ~0x0100);

      request = PT_CONTINUE;
    }

  /* An addres of (caddr_t) 1 tells ptrace to continue from where it
     was.  (If GDB wanted it to start some other way, we have already
     written a new PC value to the child.)  */
  if (ptrace (request, pid, (caddr_t) 1,
	      gdb_signal_to_host (signal)) == -1)
    perror_with_name (("ptrace"));
}


/* Support for debugging kernel virtual memory images.  */

#include <machine/pcb.h>

#include "bsd-kvm.h"

static int
i386fbsd_supply_pcb (struct regcache *regcache, struct pcb *pcb)
{
  /* The following is true for FreeBSD 4.7:

     The pcb contains %eip, %ebx, %esp, %ebp, %esi, %edi and %gs.
     This accounts for all callee-saved registers specified by the
     psABI and then some.  Here %esp contains the stack pointer at the
     point just after the call to cpu_switch().  From this information
     we reconstruct the register state as it would look when we just
     returned from cpu_switch().  */

  /* The stack pointer shouldn't be zero.  */
  if (pcb->pcb_esp == 0)
    return 0;

  pcb->pcb_esp += 4;
  regcache->raw_supply (I386_EDI_REGNUM, &pcb->pcb_edi);
  regcache->raw_supply (I386_ESI_REGNUM, &pcb->pcb_esi);
  regcache->raw_supply (I386_EBP_REGNUM, &pcb->pcb_ebp);
  regcache->raw_supply (I386_ESP_REGNUM, &pcb->pcb_esp);
  regcache->raw_supply (I386_EBX_REGNUM, &pcb->pcb_ebx);
  regcache->raw_supply (I386_EIP_REGNUM, &pcb->pcb_eip);
  regcache->raw_supply (I386_GS_REGNUM, &pcb->pcb_gs);

  return 1;
}


#ifdef PT_GETXSTATE_INFO
/* Implement the read_description method.  */

const struct target_desc *
i386_fbsd_nat_target::read_description ()
{
  static int xsave_probed;
  static uint64_t xcr0;

  if (!xsave_probed)
    {
      struct ptrace_xstate_info info;

      if (ptrace (PT_GETXSTATE_INFO, inferior_ptid.pid (),
		  (PTRACE_TYPE_ARG3) &info, sizeof (info)) == 0)
	{
	  x86bsd_xsave_len = info.xsave_len;
	  xcr0 = info.xsave_mask;
	}
      xsave_probed = 1;
    }

  if (x86bsd_xsave_len == 0)
    xcr0 = X86_XSTATE_SSE_MASK;

  return i386_target_description (xcr0, true);
}
#endif

#if defined(HAVE_PT_GETDBREGS) && defined(USE_SIGTRAP_SIGINFO)
/* Implement the supports_stopped_by_hw_breakpoints method.  */

bool
i386_fbsd_nat_target::supports_stopped_by_hw_breakpoint ()
{
  return true;
}
#endif

void _initialize_i386fbsd_nat ();
void
_initialize_i386fbsd_nat ()
{
  add_inf_child_target (&the_i386_fbsd_nat_target);

  /* Support debugging kernel virtual memory images.  */
  bsd_kvm_add_target (i386fbsd_supply_pcb);

#ifdef KERN_PROC_SIGTRAMP
  /* Normally signal frames are detected via i386fbsd_sigtramp_p.
     However, FreeBSD 9.2 through 10.1 do not include the page holding
     the signal code in core dumps.  These releases do provide a
     kern.proc.sigtramp.<pid> sysctl that returns the location of the
     signal trampoline for a running process.  We fetch the location
     of the current (gdb) process and use this to identify signal
     frames in core dumps from these releases.  */
  {
    int mib[4];
    struct kinfo_sigtramp kst;
    size_t len;

    mib[0] = CTL_KERN;
    mib[1] = KERN_PROC;
    mib[2] = KERN_PROC_SIGTRAMP;
    mib[3] = getpid ();
    len = sizeof (kst);
    if (sysctl (mib, 4, &kst, &len, NULL, 0) == 0)
      {
	i386fbsd_sigtramp_start_addr = (uintptr_t) kst.ksigtramp_start;
	i386fbsd_sigtramp_end_addr = (uintptr_t) kst.ksigtramp_end;
      }
  }
#endif
}
