.syntax unified
.thumb
.irp data, i8, i16, i32, f16, f32
.irp op1, q0, q1, q2, q4, q7
.irp op2, q0, q1, q2, q4, q7
.irp op3, q0, q1, q2, q4, q7
vmul.\data \op1, \op2, \op3
.endr
.irp op3, r0, r1, r2, r4, r7, r8, r10, r12, r14
vmul.\data \op1, \op2, \op3
.endr
.endr
.endr
.endr

vpste
vmult.i8 q0, q1, q2
vmule.f16 q0, q1, r8
