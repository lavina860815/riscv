//Original:/proj/frio/dv/testcases/seq/se_ssstep_dagprotviol/se_ssstep_dagprotviol.dsp
// Description: prioritize DAG Protection Violation and Supervisor Single Step
# mach: bfin
# sim: --environment operating

#include "test.h"
.include "testutils.inc"
start

//
// Constants and Defines
//

include(gen_int.inc)
include(selfcheck.inc)
include(std.inc)
include(mmrs.inc)
include(symtable.inc)

#ifndef STACKSIZE
#define STACKSIZE 0x10   // change for how much stack you need
#endif
#ifndef ITABLE
#define ITABLE 0xF0000000
#endif

GEN_INT_INIT(ITABLE) // set location for interrupt table

//
// Reset/Bootstrap Code
//   (Here we should set the processor operating modes, initialize registers,
//    etc.)
//

BOOT:
INIT_R_REGS(0);     // initialize general purpose regs

INIT_P_REGS(0);     // initialize the pointers

INIT_I_REGS(0);     // initialize the dsp address regs
INIT_M_REGS(0);
INIT_L_REGS(0);
INIT_B_REGS(0);

CLI R1;           // inhibit events during MMR writes

LD32_LABEL(sp, USTACK);   // setup the user stack pointer
USP = SP;

LD32_LABEL(sp, KSTACK);   // setup the kernel stack pointer
FP = SP;        // and frame pointer

LD32(p0, EVT0);      // Setup Event Vectors and Handlers

    P0 += 4;            // EVT0 not used (Emulation)

    P0 += 4;            // EVT1 not used (Reset)

LD32_LABEL(r0, NHANDLE);  // NMI Handler (Int2)
    [ P0 ++ ] = R0;

LD32_LABEL(r0, XHANDLE);  // Exception Handler (Int3)
    [ P0 ++ ] = R0;

    P0 += 4;            // EVT4 not used (Global Interrupt Enable)

LD32_LABEL(r0, HWHANDLE); // HW Error Handler (Int5)
    [ P0 ++ ] = R0;

LD32_LABEL(r0, THANDLE);  // Timer Handler (Int6)
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I7HANDLE); // IVG7 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I8HANDLE); // IVG8 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I9HANDLE); // IVG9 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I10HANDLE);// IVG10 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I11HANDLE);// IVG11 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I12HANDLE);// IVG12 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I13HANDLE);// IVG13 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I14HANDLE);// IVG14 Handler
    [ P0 ++ ] = R0;

LD32_LABEL(r0, I15HANDLE);// IVG15 Handler
    [ P0 ++ ] = R0;

LD32(p0, EVT_OVERRIDE);
    R0 = 0;
    [ P0 ++ ] = R0;

    R1 = -1;     // Change this to mask interrupts (*)
CSYNC;       // wait for MMR writes to finish
STI R1;      // sync and reenable events (implicit write to IMASK)

DUMMY:

    R0 = 0 (Z);

LT0 = r0;       // set loop counters to something deterministic
LB0 = r0;
LC0 = r0;
LT1 = r0;
LB1 = r0;
LC1 = r0;

ASTAT = r0;     // reset other internal regs
RETS = r0;      // prevent X's breaking LINK instruction

    R0 = 1;
SYSCFG = r0;    // enable ssstep


// The following code sets up the test for running in USER mode

LD32_LABEL(r0, STARTUSER);// One gets to user mode by doing a
                        // ReturnFromInterrupt (RTI)
RETI = r0;      // We need to load the return address

// Comment the following line for a USER Mode test

//    JUMP    STARTSUP;   // jump to code start for SUPERVISOR mode

RTI;

STARTSUP:
LD32_LABEL(p1, BEGIN);

LD32(p0, EVT15);

CLI R1;   // inhibit events during write to MMR
    [ P0 ] = P1;  // IVG15 (General) handler (Int 15) load with start
CSYNC;      // wait for it
STI R1;     // reenable events with proper imask

RAISE 15;       // after we RTI, INT 15 should be taken

RTI;

//
// The Main Program
//

STARTUSER:

LINK 0;     // change for how much stack frame space you need.

JUMP BEGIN;

//*********************************************************************

BEGIN:

                // COMMENT the following line for USER MODE tests
//    [--sp] = RETI;  // enable interrupts in supervisor mode

                // **** YOUR CODE GOES HERE ****

    // PUT YOUR TEST HERE!

NOP;
    I0 += 2;
    I1 += 2;
    I2 += 2;
    R7 = [ P0 ];          // cause DAG PROTECTION VIOLATION (p0 is an MMR)
    I3 += 2;


EXCPT 2;             // turn off SSSTEP

CHECK_INIT_DEF(p0); //CHECK_INIT(p0, 0xFF7FFFFC);

CHECKREG(r5, 7); // check the flag  (# SSSTEP)
CHECKREG(r4, 1); // check the flag  (# illegal opcodes)

END:
dbg_pass;            // End the test

//*********************************************************************

//
// Handlers for Events
//

NHANDLE:            // NMI Handler 2
RTN;

XHANDLE:            // Exception Handler 3

    [ -- SP ] = ASTAT; // save what we damage
    [ -- SP ] = ( R7:6 );
    R7 = SEQSTAT;
    R7 <<= 26;
    R7 >>= 26;      // only want EXCAUSE
    R6 = 0x02;      // EXCAUSE 0x02 means EXCPT 2
CC = r7 == r6;
IF CC JUMP EXCPT2;

    R6 = 0x10;      // EXCAUSE 0x10 means Single Step
CC = r7 == r6;
IF CC JUMP SSSTEP (BP);

    R6 = 0x23;      // EXCAUSE 0x23 means DAG Protection Violation
CC = r7 == r6;
IF CC JUMP DAGPROTVIOL (BP);

JUMP.S OUT;       // if the EXCAUSE is wrong the test will infinite loop

EXCPT2:             // turn off SSSTEP
    R7 = 0;
SYSCFG = r7;
JUMP.S OUT;

SSSTEP:
    R5 += 1;         // increment a counter
JUMP.S OUT;

DAGPROTVIOL:
    R7 = RETX;
    R7 += 2;
RETX = R7;      // skip offending instruction

    R4 += 1;        // increment another counter

OUT:
    ( R7:6 ) = [ SP ++ ];
ASTAT = [sp++];
RTX;

HWHANDLE:           // HW Error Handler 5
RTI;

THANDLE:            // Timer Handler 6
RTI;

I7HANDLE:           // IVG 7 Handler
RTI;

I8HANDLE:           // IVG 8 Handler
RTI;

I9HANDLE:           // IVG 9 Handler
RTI;

I10HANDLE:          // IVG 10 Handler
RTI;

I11HANDLE:          // IVG 11 Handler
RTI;

I12HANDLE:          // IVG 12 Handler
RTI;

I13HANDLE:          // IVG 13 Handler
RTI;

I14HANDLE:          // IVG 14 Handler
RTI;

I15HANDLE:          // IVG 15 Handler
RTI;


    // padding for the icache

EXCPT 0; EXCPT 0; EXCPT 0; EXCPT 0; EXCPT 0; EXCPT 0; EXCPT 0;

//
// Data Segment
//

.section MEM_DATA_ADDR_1 //.data 0xE0000000,"aw"
DATA:
    .space (0x10);

DATADUMMY:
    .space (0x10);

// Stack Segments (Both Kernel and User)

    .space (STACKSIZE);
KSTACK:

    .space (STACKSIZE);
USTACK:
