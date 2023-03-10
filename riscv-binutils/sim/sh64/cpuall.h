/* Simulator CPU header for sh.

THIS FILE IS MACHINE GENERATED WITH CGEN.

Copyright 1996-2021 Free Software Foundation, Inc.

This file is part of the GNU simulators.

   This file is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3, or (at your option)
   any later version.

   It is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License along
   with this program; if not, see <http://www.gnu.org/licenses/>.

*/

#ifndef SH_CPUALL_H
#define SH_CPUALL_H

/* Include files for each cpu family.  */

#ifdef WANT_CPU_SH64
#include "eng.h"
#include "cpu.h"
#include "decode.h"
#endif

extern const SIM_MACH sh2_mach;
extern const SIM_MACH sh2e_mach;
extern const SIM_MACH sh2a_fpu_mach;
extern const SIM_MACH sh2a_nofpu_mach;
extern const SIM_MACH sh3_mach;
extern const SIM_MACH sh3e_mach;
extern const SIM_MACH sh4_nofpu_mach;
extern const SIM_MACH sh4_mach;
extern const SIM_MACH sh4a_nofpu_mach;
extern const SIM_MACH sh4a_mach;
extern const SIM_MACH sh4al_mach;
extern const SIM_MACH sh5_mach;

#ifndef WANT_CPU
/* The ARGBUF struct.  */
struct argbuf {
  /* These are the baseclass definitions.  */
  IADDR addr;
  const IDESC *idesc;
  char trace_p;
  char profile_p;
  /* ??? Temporary hack for skip insns.  */
  char skip_count;
  char unused;
  /* cpu specific data follows */
};
#endif

#ifndef WANT_CPU
/* A cached insn.

   ??? SCACHE used to contain more than just argbuf.  We could delete the
   type entirely and always just use ARGBUF, but for future concerns and as
   a level of abstraction it is left in.  */

struct scache {
  struct argbuf argbuf;
};
#endif

#endif /* SH_CPUALL_H */
