//Original:/proj/frio/dv/testcases/seq/se_mv2lp/se_mv2lp.dsp
# mach: bfin
# sim: --environment operating

#include "test.h"
.include "testutils.inc"
start

/////////////////////////////////////////////////////////////////////////////
///////////////////////// Include Files         /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

include(std.inc)
include(selfcheck.inc)
include(symtable.inc)
include(mmrs.inc)

/////////////////////////////////////////////////////////////////////////////
///////////////////////// Defines               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

#ifndef USER_CODE_SPACE
#define USER_CODE_SPACE  CODE_ADDR_1   //
#endif
#ifndef STACKSIZE
#define STACKSIZE        0x00000010
#endif
#ifndef ITABLE
#define ITABLE           CODE_ADDR_1   //
#endif

/////////////////////////////////////////////////////////////////////////////
///////////////////////// RESET ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 RST_ISR :

    // Initialize Dregs
INIT_R_REGS(0);

    // Initialize Pregs
INIT_P_REGS(0);

    // Initialize ILBM Registers
INIT_I_REGS(0);
INIT_M_REGS(0);
INIT_L_REGS(0);
INIT_B_REGS(0);

    // Initialize the Address of the Checkreg data segment
    // **** THIS IS NEEDED WHENEVER CHECKREG IS USED ****
CHECK_INIT_DEF(p5); //CHECK_INIT(p5,   0x00BFFFFC);

    // Setup User Stack
LD32_LABEL(sp, USTACK);
USP = SP;

    // Setup Kernel Stack
LD32_LABEL(sp, KSTACK);

    // Setup Frame Pointer
FP = SP;

    // Setup Event Vector Table
LD32(p0, EVT0);

LD32_LABEL(r0, EMU_ISR);    // Emulation Handler (Int0)
    [ P0 ++ ] = R0;
LD32_LABEL(r0, RST_ISR);    // Reset Handler (Int1)
    [ P0 ++ ] = R0;
LD32_LABEL(r0, NMI_ISR);    // NMI Handler (Int2)
    [ P0 ++ ] = R0;
LD32_LABEL(r0, EXC_ISR);    // Exception Handler (Int3)
    [ P0 ++ ] = R0;
    [ P0 ++ ] = R0;                // IVT4 not used
LD32_LABEL(r0, HWE_ISR);    // HW Error Handler (Int5)
    [ P0 ++ ] = R0;
LD32_LABEL(r0, TMR_ISR);    // Timer Handler (Int6)
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV7_ISR);   // IVG7 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV8_ISR);   // IVG8 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV9_ISR);   // IVG9 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV10_ISR);  // IVG10 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV11_ISR);  // IVG11 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV12_ISR);  // IVG12 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV13_ISR);  // IVG13 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV14_ISR);  // IVG14 Handler
    [ P0 ++ ] = R0;
LD32_LABEL(r0, IGV15_ISR);  // IVG15 Handler
    [ P0 ++ ] = R0;

    // Setup the EVT_OVERRIDE MMR
    R0 = 0;
LD32(p0, EVT_OVERRIDE);
    [ P0 ] = R0;

    // Setup Interrupt Mask
    R0 = -1;
LD32(p0, IMASK);
    [ P0 ] = R0;

    // Return to Supervisor Code
RAISE 15;
NOP;

LD32_LABEL(r0, USER_CODE);
RETI = R0;
RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
///////////////////////// EMU ISR               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 EMU_ISR :

RTE;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// NMI ISR               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 NMI_ISR :

RTN;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// EXC ISR               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 EXC_ISR :

RTX;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// HWE ISR               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 HWE_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// TMR ISR               /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 TMR_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV7 ISR              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV7_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV8 ISR              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV8_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV9 ISR              /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV9_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV10 ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV10_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV11 ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV11_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV12 ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV12_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV13 ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV13_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV14 ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV14_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// IGV15 ISR             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

 IGV15_ISR :

RTI;

.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF
.dw 0xFFFF

/////////////////////////////////////////////////////////////////////////////
///////////////////////// USER CODE             /////////////////////////////
/////////////////////////////////////////////////////////////////////////////


 USER_CODE :

    P0 = 0x5 (Z);
    P1 = 0xa (Z);

    P2 = 0x0100 (Z);
    P2.H = 0x00f0;

LD32_LABEL(r0, L0T);
LD32_LABEL(r1, L0B);
LSETUP ( L0T , L0B ) LC0 = P0;
L0T:R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
    R6 += 5;
    R7 += 6;
    R0 += 2;
    R1 += 2;
LT0 = R0;
LB0 = R1;
L0B:R7 += 6;
    R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
    R6 += 5;

LD32_LABEL(r0, L1T);
LD32_LABEL(r1, L1B);
LSETUP ( L1T , L1B ) LC1 = P0;
L1T:R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
    R6 += 5;
    R7 += 6;
    R0 += 2;
    R1 += 2;
LT1 = R0;
LB1 = R1;
L1B:R7 += 6;
    R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
    R6 += 5;

LD32_LABEL(r0, L2T);
LD32_LABEL(r1, L2B);
LSETUP ( L2T , L2B ) LC0 = P0;
L2T:R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
    R6 += 5;
    R7 += 6;
    R0 += 2;
    R1 += -2;
LT0 = R0;
LB0 = R1;
    R7 += 6;
    R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
L2B:R6 += 5;

LD32_LABEL(r0, L3T);
LD32_LABEL(r1, L3B);
LSETUP ( L3T , L3B ) LC1 = P0;
L3T:R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
    R6 += 5;
    R7 += 6;
    R0 += 2;
    R1 += -2;
LT1 = R0;
LB1 = R1;
    R7 += 6;
    R2 += 1;
    R3 += 2;
    R4 += 3;
    R5 += 4;
L3B:R6 += 5;

NOP;
NOP;
NOP;
dbg_pass;        // Call Endtest Macro

/////////////////////////////////////////////////////////////////////////////
///////////////////////// DATA MEMRORY          /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

.section MEM_DATA_ADDR_1 //.data 0x00F00100,"aw"
.dd 0x01010101;
.dd 0x02020202;
.dd 0x03030303;
.dd 0x04040404;
.dd 0x05050505;
.dd 0x06060606;
.dd 0x07070707;
.dd 0x08080808;
.dd 0x09090909;
.dd 0x0a0a0a0a;
.dd 0x0b0b0b0b;
.dd 0x0c0c0c0c;
.dd 0x0d0d0d0d;
.dd 0x0e0e0e0e;
.dd 0x0f0f0f0f;

// Define Kernal Stack
.data
    .space (STACKSIZE); //<< WARNING: LINE MAY NEED MANUAL TRANSLATION >>
     KSTACK :

    .space (STACKSIZE);
     USTACK :

/////////////////////////////////////////////////////////////////////////////
///////////////////////// END OF TEST           /////////////////////////////
/////////////////////////////////////////////////////////////////////////////
