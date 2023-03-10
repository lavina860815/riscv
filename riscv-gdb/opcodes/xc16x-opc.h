/* DO NOT EDIT!  -*- buffer-read-only: t -*- vi:set ro:  */
/* Instruction opcode header for xc16x.

THIS FILE IS MACHINE GENERATED WITH CGEN.

Copyright (C) 1996-2020 Free Software Foundation, Inc.

This file is part of the GNU Binutils and/or GDB, the GNU debugger.

   This file is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3, or (at your option)
   any later version.

   It is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
   License for more details.

   You should have received a copy of the GNU General Public License along
   with this program; if not, write to the Free Software Foundation, Inc.,
   51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.

*/

#ifndef XC16X_OPC_H
#define XC16X_OPC_H

#ifdef __cplusplus
extern "C" {
#endif

/* -- opc.h */

#define CGEN_DIS_HASH_SIZE 8
#define CGEN_DIS_HASH(buf,value) (((* (unsigned char*) (buf)) >> 3) % CGEN_DIS_HASH_SIZE)

/* -- */
/* Enum declaration for xc16x instruction types.  */
typedef enum cgen_insn_type {
  XC16X_INSN_INVALID, XC16X_INSN_ADDRPOF, XC16X_INSN_SUBRPOF, XC16X_INSN_ADDBRPOF
 , XC16X_INSN_SUBBRPOF, XC16X_INSN_ADDRPAG, XC16X_INSN_SUBRPAG, XC16X_INSN_ADDBRPAG
 , XC16X_INSN_SUBBRPAG, XC16X_INSN_ADDCRPOF, XC16X_INSN_SUBCRPOF, XC16X_INSN_ADDCBRPOF
 , XC16X_INSN_SUBCBRPOF, XC16X_INSN_ADDCRPAG, XC16X_INSN_SUBCRPAG, XC16X_INSN_ADDCBRPAG
 , XC16X_INSN_SUBCBRPAG, XC16X_INSN_ADDRPOFR, XC16X_INSN_SUBRPOFR, XC16X_INSN_ADDBRPOFR
 , XC16X_INSN_SUBBRPOFR, XC16X_INSN_ADDCRPOFR, XC16X_INSN_SUBCRPOFR, XC16X_INSN_ADDCBRPOFR
 , XC16X_INSN_SUBCBRPOFR, XC16X_INSN_ADDRHPOF, XC16X_INSN_SUBRHPOF, XC16X_INSN_ADDBRHPOF
 , XC16X_INSN_SUBBRHPOF, XC16X_INSN_ADDRHPOF3, XC16X_INSN_SUBRHPOF3, XC16X_INSN_ADDBRHPAG3
 , XC16X_INSN_SUBBRHPAG3, XC16X_INSN_ADDRHPAG3, XC16X_INSN_SUBRHPAG3, XC16X_INSN_ADDBRHPOF3
 , XC16X_INSN_SUBBRHPOF3, XC16X_INSN_ADDRBHPOF, XC16X_INSN_SUBRBHPOF, XC16X_INSN_ADDBRHPAG
 , XC16X_INSN_SUBBRHPAG, XC16X_INSN_ADDCRHPOF, XC16X_INSN_SUBCRHPOF, XC16X_INSN_ADDCBRHPOF
 , XC16X_INSN_SUBCBRHPOF, XC16X_INSN_ADDCRHPOF3, XC16X_INSN_SUBCRHPOF3, XC16X_INSN_ADDCBRHPAG3
 , XC16X_INSN_SUBCBRHPAG3, XC16X_INSN_ADDCRHPAG3, XC16X_INSN_SUBCRHPAG3, XC16X_INSN_ADDCBRHPOF3
 , XC16X_INSN_SUBCBRHPOF3, XC16X_INSN_ADDCRBHPOF, XC16X_INSN_SUBCRBHPOF, XC16X_INSN_ADDCBRHPAG
 , XC16X_INSN_SUBCBRHPAG, XC16X_INSN_ADDRI, XC16X_INSN_SUBRI, XC16X_INSN_ADDBRI
 , XC16X_INSN_SUBBRI, XC16X_INSN_ADDRIM, XC16X_INSN_SUBRIM, XC16X_INSN_ADDBRIM
 , XC16X_INSN_SUBBRIM, XC16X_INSN_ADDCRI, XC16X_INSN_SUBCRI, XC16X_INSN_ADDCBRI
 , XC16X_INSN_SUBCBRI, XC16X_INSN_ADDCRIM, XC16X_INSN_SUBCRIM, XC16X_INSN_ADDCBRIM
 , XC16X_INSN_SUBCBRIM, XC16X_INSN_ADDR, XC16X_INSN_SUBR, XC16X_INSN_ADDBR
 , XC16X_INSN_SUBBR, XC16X_INSN_ADD2, XC16X_INSN_SUB2, XC16X_INSN_ADDB2
 , XC16X_INSN_SUBB2, XC16X_INSN_ADD2I, XC16X_INSN_SUB2I, XC16X_INSN_ADDB2I
 , XC16X_INSN_SUBB2I, XC16X_INSN_ADDCR, XC16X_INSN_SUBCR, XC16X_INSN_ADDBCR
 , XC16X_INSN_SUBBCR, XC16X_INSN_ADDCR2, XC16X_INSN_SUBCR2, XC16X_INSN_ADDBCR2
 , XC16X_INSN_SUBBCR2, XC16X_INSN_ADDCR2I, XC16X_INSN_SUBCR2I, XC16X_INSN_ADDBCR2I
 , XC16X_INSN_SUBBCR2I, XC16X_INSN_ADDRM2, XC16X_INSN_ADDRM3, XC16X_INSN_ADDRM
 , XC16X_INSN_ADDRM1, XC16X_INSN_SUBRM3, XC16X_INSN_SUBRM2, XC16X_INSN_SUBRM1
 , XC16X_INSN_SUBRM, XC16X_INSN_ADDBRM2, XC16X_INSN_ADDBRM3, XC16X_INSN_ADDBRM
 , XC16X_INSN_ADDBRM1, XC16X_INSN_SUBBRM3, XC16X_INSN_SUBBRM2, XC16X_INSN_SUBBRM1
 , XC16X_INSN_SUBBRM, XC16X_INSN_ADDCRM2, XC16X_INSN_ADDCRM3, XC16X_INSN_ADDCRM
 , XC16X_INSN_ADDCRM1, XC16X_INSN_SUBCRM3, XC16X_INSN_SUBCRM2, XC16X_INSN_SUBCRM1
 , XC16X_INSN_SUBCRM, XC16X_INSN_ADDCBRM2, XC16X_INSN_ADDCBRM3, XC16X_INSN_ADDCBRM
 , XC16X_INSN_ADDCBRM1, XC16X_INSN_SUBCBRM3, XC16X_INSN_SUBCBRM2, XC16X_INSN_SUBCBRM1
 , XC16X_INSN_SUBCBRM, XC16X_INSN_MULS, XC16X_INSN_MULU, XC16X_INSN_DIV
 , XC16X_INSN_DIVL, XC16X_INSN_DIVLU, XC16X_INSN_DIVU, XC16X_INSN_CPL
 , XC16X_INSN_CPLB, XC16X_INSN_NEG, XC16X_INSN_NEGB, XC16X_INSN_ANDR
 , XC16X_INSN_ORR, XC16X_INSN_XORR, XC16X_INSN_ANDBR, XC16X_INSN_ORBR
 , XC16X_INSN_XORBR, XC16X_INSN_ANDRI, XC16X_INSN_ORRI, XC16X_INSN_XORRI
 , XC16X_INSN_ANDBRI, XC16X_INSN_ORBRI, XC16X_INSN_XORBRI, XC16X_INSN_ANDRIM
 , XC16X_INSN_ORRIM, XC16X_INSN_XORRIM, XC16X_INSN_ANDBRIM, XC16X_INSN_ORBRIM
 , XC16X_INSN_XORBRIM, XC16X_INSN_AND2, XC16X_INSN_OR2, XC16X_INSN_XOR2
 , XC16X_INSN_ANDB2, XC16X_INSN_ORB2, XC16X_INSN_XORB2, XC16X_INSN_AND2I
 , XC16X_INSN_OR2I, XC16X_INSN_XOR2I, XC16X_INSN_ANDB2I, XC16X_INSN_ORB2I
 , XC16X_INSN_XORB2I, XC16X_INSN_ANDPOFR, XC16X_INSN_ORPOFR, XC16X_INSN_XORPOFR
 , XC16X_INSN_ANDBPOFR, XC16X_INSN_ORBPOFR, XC16X_INSN_XORBPOFR, XC16X_INSN_ANDRPOFR
 , XC16X_INSN_ORRPOFR, XC16X_INSN_XORRPOFR, XC16X_INSN_ANDBRPOFR, XC16X_INSN_ORBRPOFR
 , XC16X_INSN_XORBRPOFR, XC16X_INSN_ANDRM2, XC16X_INSN_ANDRM3, XC16X_INSN_ANDRM
 , XC16X_INSN_ANDRM1, XC16X_INSN_ORRM3, XC16X_INSN_ORRM2, XC16X_INSN_ORRM1
 , XC16X_INSN_ORRM, XC16X_INSN_XORRM3, XC16X_INSN_XORRM2, XC16X_INSN_XORRM1
 , XC16X_INSN_XORRM, XC16X_INSN_ANDBRM2, XC16X_INSN_ANDBRM3, XC16X_INSN_ANDBRM
 , XC16X_INSN_ANDBRM1, XC16X_INSN_ORBRM3, XC16X_INSN_ORBRM2, XC16X_INSN_ORBRM1
 , XC16X_INSN_ORBRM, XC16X_INSN_XORBRM3, XC16X_INSN_XORBRM2, XC16X_INSN_XORBRM1
 , XC16X_INSN_XORBRM, XC16X_INSN_MOVR, XC16X_INSN_MOVRB, XC16X_INSN_MOVRI
 , XC16X_INSN_MOVBRI, XC16X_INSN_MOVI, XC16X_INSN_MOVBI, XC16X_INSN_MOVR2
 , XC16X_INSN_MOVBR2, XC16X_INSN_MOVRI2, XC16X_INSN_MOVBRI2, XC16X_INSN_MOVRI3
 , XC16X_INSN_MOVBRI3, XC16X_INSN_MOV2I, XC16X_INSN_MOVB2I, XC16X_INSN_MOV6I
 , XC16X_INSN_MOVB6I, XC16X_INSN_MOV7I, XC16X_INSN_MOVB7I, XC16X_INSN_MOV8I
 , XC16X_INSN_MOVB8I, XC16X_INSN_MOV9I, XC16X_INSN_MOVB9I, XC16X_INSN_MOV10I
 , XC16X_INSN_MOVB10I, XC16X_INSN_MOVRI11, XC16X_INSN_MOVBRI11, XC16X_INSN_MOVRI12
 , XC16X_INSN_MOVBRI12, XC16X_INSN_MOVEHM5, XC16X_INSN_MOVEHM6, XC16X_INSN_MOVEHM7
 , XC16X_INSN_MOVEHM8, XC16X_INSN_MOVEHM9, XC16X_INSN_MOVEHM10, XC16X_INSN_MOVRMP
 , XC16X_INSN_MOVRMP1, XC16X_INSN_MOVRMP2, XC16X_INSN_MOVRMP3, XC16X_INSN_MOVRMP4
 , XC16X_INSN_MOVRMP5, XC16X_INSN_MOVEHM1, XC16X_INSN_MOVEHM2, XC16X_INSN_MOVEHM3
 , XC16X_INSN_MOVEHM4, XC16X_INSN_MVE12, XC16X_INSN_MVE13, XC16X_INSN_MOVER12
 , XC16X_INSN_MVR13, XC16X_INSN_MVER12, XC16X_INSN_MVER13, XC16X_INSN_MOVR12
 , XC16X_INSN_MOVR13, XC16X_INSN_MOVBSRR, XC16X_INSN_MOVBZRR, XC16X_INSN_MOVBSRPOFM
 , XC16X_INSN_MOVBSPOFMR, XC16X_INSN_MOVBZRPOFM, XC16X_INSN_MOVBZPOFMR, XC16X_INSN_MOVEBS14
 , XC16X_INSN_MOVEBS15, XC16X_INSN_MOVERBS14, XC16X_INSN_MOVRBS15, XC16X_INSN_MOVEBZ14
 , XC16X_INSN_MOVEBZ15, XC16X_INSN_MOVERBZ14, XC16X_INSN_MOVRBZ15, XC16X_INSN_MOVRBS
 , XC16X_INSN_MOVRBZ, XC16X_INSN_JMPA0, XC16X_INSN_JMPA1, XC16X_INSN_JMPA_
 , XC16X_INSN_JMPI, XC16X_INSN_JMPR_NENZ, XC16X_INSN_JMPR_SGT, XC16X_INSN_JMPR_Z
 , XC16X_INSN_JMPR_V, XC16X_INSN_JMPR_NV, XC16X_INSN_JMPR_N, XC16X_INSN_JMPR_NN
 , XC16X_INSN_JMPR_C, XC16X_INSN_JMPR_NC, XC16X_INSN_JMPR_EQ, XC16X_INSN_JMPR_NE
 , XC16X_INSN_JMPR_ULT, XC16X_INSN_JMPR_ULE, XC16X_INSN_JMPR_UGE, XC16X_INSN_JMPR_UGT
 , XC16X_INSN_JMPR_SLE, XC16X_INSN_JMPR_SGE, XC16X_INSN_JMPR_NET, XC16X_INSN_JMPR_UC
 , XC16X_INSN_JMPR_SLT, XC16X_INSN_JMPSEG, XC16X_INSN_JMPS, XC16X_INSN_JB
 , XC16X_INSN_JBC, XC16X_INSN_JNB, XC16X_INSN_JNBS, XC16X_INSN_CALLA0
 , XC16X_INSN_CALLA1, XC16X_INSN_CALLA_, XC16X_INSN_CALLI, XC16X_INSN_CALLR
 , XC16X_INSN_CALLSEG, XC16X_INSN_CALLS, XC16X_INSN_PCALL, XC16X_INSN_TRAP
 , XC16X_INSN_RET, XC16X_INSN_RETS, XC16X_INSN_RETP, XC16X_INSN_RETI
 , XC16X_INSN_POP, XC16X_INSN_PUSH, XC16X_INSN_SCXTI, XC16X_INSN_SCXTRPOFM
 , XC16X_INSN_SCXTMG, XC16X_INSN_SCXTM, XC16X_INSN_NOP, XC16X_INSN_SRSTM
 , XC16X_INSN_IDLEM, XC16X_INSN_PWRDNM, XC16X_INSN_DISWDTM, XC16X_INSN_ENWDTM
 , XC16X_INSN_EINITM, XC16X_INSN_SRVWDTM, XC16X_INSN_SBRK, XC16X_INSN_ATOMIC
 , XC16X_INSN_EXTR, XC16X_INSN_EXTP, XC16X_INSN_EXTP1, XC16X_INSN_EXTPG1
 , XC16X_INSN_EXTPR, XC16X_INSN_EXTPR1, XC16X_INSN_EXTS, XC16X_INSN_EXTS1
 , XC16X_INSN_EXTSR, XC16X_INSN_EXTSR1, XC16X_INSN_PRIOR, XC16X_INSN_BCLR18
 , XC16X_INSN_BCLR0, XC16X_INSN_BCLR1, XC16X_INSN_BCLR2, XC16X_INSN_BCLR3
 , XC16X_INSN_BCLR4, XC16X_INSN_BCLR5, XC16X_INSN_BCLR6, XC16X_INSN_BCLR7
 , XC16X_INSN_BCLR8, XC16X_INSN_BCLR9, XC16X_INSN_BCLR10, XC16X_INSN_BCLR11
 , XC16X_INSN_BCLR12, XC16X_INSN_BCLR13, XC16X_INSN_BCLR14, XC16X_INSN_BCLR15
 , XC16X_INSN_BSET19, XC16X_INSN_BSET0, XC16X_INSN_BSET1, XC16X_INSN_BSET2
 , XC16X_INSN_BSET3, XC16X_INSN_BSET4, XC16X_INSN_BSET5, XC16X_INSN_BSET6
 , XC16X_INSN_BSET7, XC16X_INSN_BSET8, XC16X_INSN_BSET9, XC16X_INSN_BSET10
 , XC16X_INSN_BSET11, XC16X_INSN_BSET12, XC16X_INSN_BSET13, XC16X_INSN_BSET14
 , XC16X_INSN_BSET15, XC16X_INSN_BMOV, XC16X_INSN_BMOVN, XC16X_INSN_BAND
 , XC16X_INSN_BOR, XC16X_INSN_BXOR, XC16X_INSN_BCMP, XC16X_INSN_BFLDL
 , XC16X_INSN_BFLDH, XC16X_INSN_CMPR, XC16X_INSN_CMPBR, XC16X_INSN_CMPRI
 , XC16X_INSN_CMPBRI, XC16X_INSN_CMPI, XC16X_INSN_CMPBI, XC16X_INSN_CMPR2
 , XC16X_INSN_CMPBR2, XC16X_INSN_CMP2I, XC16X_INSN_CMPB2I, XC16X_INSN_CMP04
 , XC16X_INSN_CMPB4, XC16X_INSN_CMP004, XC16X_INSN_CMP0004, XC16X_INSN_CMPB04
 , XC16X_INSN_CMPB004, XC16X_INSN_CMPD1RI, XC16X_INSN_CMPD2RI, XC16X_INSN_CMPI1RI
 , XC16X_INSN_CMPI2RI, XC16X_INSN_CMPD1RIM, XC16X_INSN_CMPD2RIM, XC16X_INSN_CMPI1RIM
 , XC16X_INSN_CMPI2RIM, XC16X_INSN_CMPD1RP, XC16X_INSN_CMPD2RP, XC16X_INSN_CMPI1RP
 , XC16X_INSN_CMPI2RP, XC16X_INSN_CMPD1RM, XC16X_INSN_CMPD2RM, XC16X_INSN_CMPI1RM
 , XC16X_INSN_CMPI2RM, XC16X_INSN_CMPD1RMI, XC16X_INSN_CMPD2RMI, XC16X_INSN_CMPI1RMI
 , XC16X_INSN_CMPI2RMI, XC16X_INSN_SHLR, XC16X_INSN_SHRR, XC16X_INSN_ROLR
 , XC16X_INSN_RORR, XC16X_INSN_ASHRR, XC16X_INSN_SHLRI, XC16X_INSN_SHRRI
 , XC16X_INSN_ROLRI, XC16X_INSN_RORRI, XC16X_INSN_ASHRRI
} CGEN_INSN_TYPE;

/* Index of `invalid' insn place holder.  */
#define CGEN_INSN_INVALID XC16X_INSN_INVALID

/* Total number of insns in table.  */
#define MAX_INSNS ((int) XC16X_INSN_ASHRRI + 1)

/* This struct records data prior to insertion or after extraction.  */
struct cgen_fields
{
  int length;
  long f_nil;
  long f_anyof;
  long f_op1;
  long f_op2;
  long f_condcode;
  long f_icondcode;
  long f_rcond;
  long f_qcond;
  long f_extccode;
  long f_r0;
  long f_r1;
  long f_r2;
  long f_r3;
  long f_r4;
  long f_uimm2;
  long f_uimm3;
  long f_uimm4;
  long f_uimm7;
  long f_uimm8;
  long f_uimm16;
  long f_memory;
  long f_memgr8;
  long f_rel8;
  long f_relhi8;
  long f_reg8;
  long f_regmem8;
  long f_regoff8;
  long f_reghi8;
  long f_regb8;
  long f_seg8;
  long f_segnum8;
  long f_mask8;
  long f_pagenum;
  long f_datahi8;
  long f_data8;
  long f_offset16;
  long f_op_bit1;
  long f_op_bit2;
  long f_op_bit4;
  long f_op_bit3;
  long f_op_2bit;
  long f_op_bitone;
  long f_op_onebit;
  long f_op_1bit;
  long f_op_lbit4;
  long f_op_lbit2;
  long f_op_bit8;
  long f_op_bit16;
  long f_qbit;
  long f_qlobit;
  long f_qhibit;
  long f_qlobit2;
  long f_pof;
};

#define CGEN_INIT_PARSE(od) \
{\
}
#define CGEN_INIT_INSERT(od) \
{\
}
#define CGEN_INIT_EXTRACT(od) \
{\
}
#define CGEN_INIT_PRINT(od) \
{\
}


   #ifdef __cplusplus
   }
   #endif

#endif /* XC16X_OPC_H */
