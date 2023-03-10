# name: MVE vabd instructions
# as: -march=armv8.1-m.main+mve.fp
# objdump: -dr --prefix-addresses --show-raw-insn -marmv8.1-m.main

.*: +file format .*arm.*

Disassembly of section .text:
[^>]*> ff00 0740 	vabd.u8	q0, q0, q0
[^>]*> ff00 0742 	vabd.u8	q0, q0, q1
[^>]*> ff00 0744 	vabd.u8	q0, q0, q2
[^>]*> ff00 0748 	vabd.u8	q0, q0, q4
[^>]*> ff00 074e 	vabd.u8	q0, q0, q7
[^>]*> ff02 0740 	vabd.u8	q0, q1, q0
[^>]*> ff02 0742 	vabd.u8	q0, q1, q1
[^>]*> ff02 0744 	vabd.u8	q0, q1, q2
[^>]*> ff02 0748 	vabd.u8	q0, q1, q4
[^>]*> ff02 074e 	vabd.u8	q0, q1, q7
[^>]*> ff04 0740 	vabd.u8	q0, q2, q0
[^>]*> ff04 0742 	vabd.u8	q0, q2, q1
[^>]*> ff04 0744 	vabd.u8	q0, q2, q2
[^>]*> ff04 0748 	vabd.u8	q0, q2, q4
[^>]*> ff04 074e 	vabd.u8	q0, q2, q7
[^>]*> ff08 0740 	vabd.u8	q0, q4, q0
[^>]*> ff08 0742 	vabd.u8	q0, q4, q1
[^>]*> ff08 0744 	vabd.u8	q0, q4, q2
[^>]*> ff08 0748 	vabd.u8	q0, q4, q4
[^>]*> ff08 074e 	vabd.u8	q0, q4, q7
[^>]*> ff0e 0740 	vabd.u8	q0, q7, q0
[^>]*> ff0e 0742 	vabd.u8	q0, q7, q1
[^>]*> ff0e 0744 	vabd.u8	q0, q7, q2
[^>]*> ff0e 0748 	vabd.u8	q0, q7, q4
[^>]*> ff0e 074e 	vabd.u8	q0, q7, q7
[^>]*> ff00 2740 	vabd.u8	q1, q0, q0
[^>]*> ff00 2742 	vabd.u8	q1, q0, q1
[^>]*> ff00 2744 	vabd.u8	q1, q0, q2
[^>]*> ff00 2748 	vabd.u8	q1, q0, q4
[^>]*> ff00 274e 	vabd.u8	q1, q0, q7
[^>]*> ff02 2740 	vabd.u8	q1, q1, q0
[^>]*> ff02 2742 	vabd.u8	q1, q1, q1
[^>]*> ff02 2744 	vabd.u8	q1, q1, q2
[^>]*> ff02 2748 	vabd.u8	q1, q1, q4
[^>]*> ff02 274e 	vabd.u8	q1, q1, q7
[^>]*> ff04 2740 	vabd.u8	q1, q2, q0
[^>]*> ff04 2742 	vabd.u8	q1, q2, q1
[^>]*> ff04 2744 	vabd.u8	q1, q2, q2
[^>]*> ff04 2748 	vabd.u8	q1, q2, q4
[^>]*> ff04 274e 	vabd.u8	q1, q2, q7
[^>]*> ff08 2740 	vabd.u8	q1, q4, q0
[^>]*> ff08 2742 	vabd.u8	q1, q4, q1
[^>]*> ff08 2744 	vabd.u8	q1, q4, q2
[^>]*> ff08 2748 	vabd.u8	q1, q4, q4
[^>]*> ff08 274e 	vabd.u8	q1, q4, q7
[^>]*> ff0e 2740 	vabd.u8	q1, q7, q0
[^>]*> ff0e 2742 	vabd.u8	q1, q7, q1
[^>]*> ff0e 2744 	vabd.u8	q1, q7, q2
[^>]*> ff0e 2748 	vabd.u8	q1, q7, q4
[^>]*> ff0e 274e 	vabd.u8	q1, q7, q7
[^>]*> ff00 4740 	vabd.u8	q2, q0, q0
[^>]*> ff00 4742 	vabd.u8	q2, q0, q1
[^>]*> ff00 4744 	vabd.u8	q2, q0, q2
[^>]*> ff00 4748 	vabd.u8	q2, q0, q4
[^>]*> ff00 474e 	vabd.u8	q2, q0, q7
[^>]*> ff02 4740 	vabd.u8	q2, q1, q0
[^>]*> ff02 4742 	vabd.u8	q2, q1, q1
[^>]*> ff02 4744 	vabd.u8	q2, q1, q2
[^>]*> ff02 4748 	vabd.u8	q2, q1, q4
[^>]*> ff02 474e 	vabd.u8	q2, q1, q7
[^>]*> ff04 4740 	vabd.u8	q2, q2, q0
[^>]*> ff04 4742 	vabd.u8	q2, q2, q1
[^>]*> ff04 4744 	vabd.u8	q2, q2, q2
[^>]*> ff04 4748 	vabd.u8	q2, q2, q4
[^>]*> ff04 474e 	vabd.u8	q2, q2, q7
[^>]*> ff08 4740 	vabd.u8	q2, q4, q0
[^>]*> ff08 4742 	vabd.u8	q2, q4, q1
[^>]*> ff08 4744 	vabd.u8	q2, q4, q2
[^>]*> ff08 4748 	vabd.u8	q2, q4, q4
[^>]*> ff08 474e 	vabd.u8	q2, q4, q7
[^>]*> ff0e 4740 	vabd.u8	q2, q7, q0
[^>]*> ff0e 4742 	vabd.u8	q2, q7, q1
[^>]*> ff0e 4744 	vabd.u8	q2, q7, q2
[^>]*> ff0e 4748 	vabd.u8	q2, q7, q4
[^>]*> ff0e 474e 	vabd.u8	q2, q7, q7
[^>]*> ff00 8740 	vabd.u8	q4, q0, q0
[^>]*> ff00 8742 	vabd.u8	q4, q0, q1
[^>]*> ff00 8744 	vabd.u8	q4, q0, q2
[^>]*> ff00 8748 	vabd.u8	q4, q0, q4
[^>]*> ff00 874e 	vabd.u8	q4, q0, q7
[^>]*> ff02 8740 	vabd.u8	q4, q1, q0
[^>]*> ff02 8742 	vabd.u8	q4, q1, q1
[^>]*> ff02 8744 	vabd.u8	q4, q1, q2
[^>]*> ff02 8748 	vabd.u8	q4, q1, q4
[^>]*> ff02 874e 	vabd.u8	q4, q1, q7
[^>]*> ff04 8740 	vabd.u8	q4, q2, q0
[^>]*> ff04 8742 	vabd.u8	q4, q2, q1
[^>]*> ff04 8744 	vabd.u8	q4, q2, q2
[^>]*> ff04 8748 	vabd.u8	q4, q2, q4
[^>]*> ff04 874e 	vabd.u8	q4, q2, q7
[^>]*> ff08 8740 	vabd.u8	q4, q4, q0
[^>]*> ff08 8742 	vabd.u8	q4, q4, q1
[^>]*> ff08 8744 	vabd.u8	q4, q4, q2
[^>]*> ff08 8748 	vabd.u8	q4, q4, q4
[^>]*> ff08 874e 	vabd.u8	q4, q4, q7
[^>]*> ff0e 8740 	vabd.u8	q4, q7, q0
[^>]*> ff0e 8742 	vabd.u8	q4, q7, q1
[^>]*> ff0e 8744 	vabd.u8	q4, q7, q2
[^>]*> ff0e 8748 	vabd.u8	q4, q7, q4
[^>]*> ff0e 874e 	vabd.u8	q4, q7, q7
[^>]*> ff00 e740 	vabd.u8	q7, q0, q0
[^>]*> ff00 e742 	vabd.u8	q7, q0, q1
[^>]*> ff00 e744 	vabd.u8	q7, q0, q2
[^>]*> ff00 e748 	vabd.u8	q7, q0, q4
[^>]*> ff00 e74e 	vabd.u8	q7, q0, q7
[^>]*> ff02 e740 	vabd.u8	q7, q1, q0
[^>]*> ff02 e742 	vabd.u8	q7, q1, q1
[^>]*> ff02 e744 	vabd.u8	q7, q1, q2
[^>]*> ff02 e748 	vabd.u8	q7, q1, q4
[^>]*> ff02 e74e 	vabd.u8	q7, q1, q7
[^>]*> ff04 e740 	vabd.u8	q7, q2, q0
[^>]*> ff04 e742 	vabd.u8	q7, q2, q1
[^>]*> ff04 e744 	vabd.u8	q7, q2, q2
[^>]*> ff04 e748 	vabd.u8	q7, q2, q4
[^>]*> ff04 e74e 	vabd.u8	q7, q2, q7
[^>]*> ff08 e740 	vabd.u8	q7, q4, q0
[^>]*> ff08 e742 	vabd.u8	q7, q4, q1
[^>]*> ff08 e744 	vabd.u8	q7, q4, q2
[^>]*> ff08 e748 	vabd.u8	q7, q4, q4
[^>]*> ff08 e74e 	vabd.u8	q7, q4, q7
[^>]*> ff0e e740 	vabd.u8	q7, q7, q0
[^>]*> ff0e e742 	vabd.u8	q7, q7, q1
[^>]*> ff0e e744 	vabd.u8	q7, q7, q2
[^>]*> ff0e e748 	vabd.u8	q7, q7, q4
[^>]*> ff0e e74e 	vabd.u8	q7, q7, q7
[^>]*> ef00 0740 	vabd.s8	q0, q0, q0
[^>]*> ef00 0742 	vabd.s8	q0, q0, q1
[^>]*> ef00 0744 	vabd.s8	q0, q0, q2
[^>]*> ef00 0748 	vabd.s8	q0, q0, q4
[^>]*> ef00 074e 	vabd.s8	q0, q0, q7
[^>]*> ef02 0740 	vabd.s8	q0, q1, q0
[^>]*> ef02 0742 	vabd.s8	q0, q1, q1
[^>]*> ef02 0744 	vabd.s8	q0, q1, q2
[^>]*> ef02 0748 	vabd.s8	q0, q1, q4
[^>]*> ef02 074e 	vabd.s8	q0, q1, q7
[^>]*> ef04 0740 	vabd.s8	q0, q2, q0
[^>]*> ef04 0742 	vabd.s8	q0, q2, q1
[^>]*> ef04 0744 	vabd.s8	q0, q2, q2
[^>]*> ef04 0748 	vabd.s8	q0, q2, q4
[^>]*> ef04 074e 	vabd.s8	q0, q2, q7
[^>]*> ef08 0740 	vabd.s8	q0, q4, q0
[^>]*> ef08 0742 	vabd.s8	q0, q4, q1
[^>]*> ef08 0744 	vabd.s8	q0, q4, q2
[^>]*> ef08 0748 	vabd.s8	q0, q4, q4
[^>]*> ef08 074e 	vabd.s8	q0, q4, q7
[^>]*> ef0e 0740 	vabd.s8	q0, q7, q0
[^>]*> ef0e 0742 	vabd.s8	q0, q7, q1
[^>]*> ef0e 0744 	vabd.s8	q0, q7, q2
[^>]*> ef0e 0748 	vabd.s8	q0, q7, q4
[^>]*> ef0e 074e 	vabd.s8	q0, q7, q7
[^>]*> ef00 2740 	vabd.s8	q1, q0, q0
[^>]*> ef00 2742 	vabd.s8	q1, q0, q1
[^>]*> ef00 2744 	vabd.s8	q1, q0, q2
[^>]*> ef00 2748 	vabd.s8	q1, q0, q4
[^>]*> ef00 274e 	vabd.s8	q1, q0, q7
[^>]*> ef02 2740 	vabd.s8	q1, q1, q0
[^>]*> ef02 2742 	vabd.s8	q1, q1, q1
[^>]*> ef02 2744 	vabd.s8	q1, q1, q2
[^>]*> ef02 2748 	vabd.s8	q1, q1, q4
[^>]*> ef02 274e 	vabd.s8	q1, q1, q7
[^>]*> ef04 2740 	vabd.s8	q1, q2, q0
[^>]*> ef04 2742 	vabd.s8	q1, q2, q1
[^>]*> ef04 2744 	vabd.s8	q1, q2, q2
[^>]*> ef04 2748 	vabd.s8	q1, q2, q4
[^>]*> ef04 274e 	vabd.s8	q1, q2, q7
[^>]*> ef08 2740 	vabd.s8	q1, q4, q0
[^>]*> ef08 2742 	vabd.s8	q1, q4, q1
[^>]*> ef08 2744 	vabd.s8	q1, q4, q2
[^>]*> ef08 2748 	vabd.s8	q1, q4, q4
[^>]*> ef08 274e 	vabd.s8	q1, q4, q7
[^>]*> ef0e 2740 	vabd.s8	q1, q7, q0
[^>]*> ef0e 2742 	vabd.s8	q1, q7, q1
[^>]*> ef0e 2744 	vabd.s8	q1, q7, q2
[^>]*> ef0e 2748 	vabd.s8	q1, q7, q4
[^>]*> ef0e 274e 	vabd.s8	q1, q7, q7
[^>]*> ef00 4740 	vabd.s8	q2, q0, q0
[^>]*> ef00 4742 	vabd.s8	q2, q0, q1
[^>]*> ef00 4744 	vabd.s8	q2, q0, q2
[^>]*> ef00 4748 	vabd.s8	q2, q0, q4
[^>]*> ef00 474e 	vabd.s8	q2, q0, q7
[^>]*> ef02 4740 	vabd.s8	q2, q1, q0
[^>]*> ef02 4742 	vabd.s8	q2, q1, q1
[^>]*> ef02 4744 	vabd.s8	q2, q1, q2
[^>]*> ef02 4748 	vabd.s8	q2, q1, q4
[^>]*> ef02 474e 	vabd.s8	q2, q1, q7
[^>]*> ef04 4740 	vabd.s8	q2, q2, q0
[^>]*> ef04 4742 	vabd.s8	q2, q2, q1
[^>]*> ef04 4744 	vabd.s8	q2, q2, q2
[^>]*> ef04 4748 	vabd.s8	q2, q2, q4
[^>]*> ef04 474e 	vabd.s8	q2, q2, q7
[^>]*> ef08 4740 	vabd.s8	q2, q4, q0
[^>]*> ef08 4742 	vabd.s8	q2, q4, q1
[^>]*> ef08 4744 	vabd.s8	q2, q4, q2
[^>]*> ef08 4748 	vabd.s8	q2, q4, q4
[^>]*> ef08 474e 	vabd.s8	q2, q4, q7
[^>]*> ef0e 4740 	vabd.s8	q2, q7, q0
[^>]*> ef0e 4742 	vabd.s8	q2, q7, q1
[^>]*> ef0e 4744 	vabd.s8	q2, q7, q2
[^>]*> ef0e 4748 	vabd.s8	q2, q7, q4
[^>]*> ef0e 474e 	vabd.s8	q2, q7, q7
[^>]*> ef00 8740 	vabd.s8	q4, q0, q0
[^>]*> ef00 8742 	vabd.s8	q4, q0, q1
[^>]*> ef00 8744 	vabd.s8	q4, q0, q2
[^>]*> ef00 8748 	vabd.s8	q4, q0, q4
[^>]*> ef00 874e 	vabd.s8	q4, q0, q7
[^>]*> ef02 8740 	vabd.s8	q4, q1, q0
[^>]*> ef02 8742 	vabd.s8	q4, q1, q1
[^>]*> ef02 8744 	vabd.s8	q4, q1, q2
[^>]*> ef02 8748 	vabd.s8	q4, q1, q4
[^>]*> ef02 874e 	vabd.s8	q4, q1, q7
[^>]*> ef04 8740 	vabd.s8	q4, q2, q0
[^>]*> ef04 8742 	vabd.s8	q4, q2, q1
[^>]*> ef04 8744 	vabd.s8	q4, q2, q2
[^>]*> ef04 8748 	vabd.s8	q4, q2, q4
[^>]*> ef04 874e 	vabd.s8	q4, q2, q7
[^>]*> ef08 8740 	vabd.s8	q4, q4, q0
[^>]*> ef08 8742 	vabd.s8	q4, q4, q1
[^>]*> ef08 8744 	vabd.s8	q4, q4, q2
[^>]*> ef08 8748 	vabd.s8	q4, q4, q4
[^>]*> ef08 874e 	vabd.s8	q4, q4, q7
[^>]*> ef0e 8740 	vabd.s8	q4, q7, q0
[^>]*> ef0e 8742 	vabd.s8	q4, q7, q1
[^>]*> ef0e 8744 	vabd.s8	q4, q7, q2
[^>]*> ef0e 8748 	vabd.s8	q4, q7, q4
[^>]*> ef0e 874e 	vabd.s8	q4, q7, q7
[^>]*> ef00 e740 	vabd.s8	q7, q0, q0
[^>]*> ef00 e742 	vabd.s8	q7, q0, q1
[^>]*> ef00 e744 	vabd.s8	q7, q0, q2
[^>]*> ef00 e748 	vabd.s8	q7, q0, q4
[^>]*> ef00 e74e 	vabd.s8	q7, q0, q7
[^>]*> ef02 e740 	vabd.s8	q7, q1, q0
[^>]*> ef02 e742 	vabd.s8	q7, q1, q1
[^>]*> ef02 e744 	vabd.s8	q7, q1, q2
[^>]*> ef02 e748 	vabd.s8	q7, q1, q4
[^>]*> ef02 e74e 	vabd.s8	q7, q1, q7
[^>]*> ef04 e740 	vabd.s8	q7, q2, q0
[^>]*> ef04 e742 	vabd.s8	q7, q2, q1
[^>]*> ef04 e744 	vabd.s8	q7, q2, q2
[^>]*> ef04 e748 	vabd.s8	q7, q2, q4
[^>]*> ef04 e74e 	vabd.s8	q7, q2, q7
[^>]*> ef08 e740 	vabd.s8	q7, q4, q0
[^>]*> ef08 e742 	vabd.s8	q7, q4, q1
[^>]*> ef08 e744 	vabd.s8	q7, q4, q2
[^>]*> ef08 e748 	vabd.s8	q7, q4, q4
[^>]*> ef08 e74e 	vabd.s8	q7, q4, q7
[^>]*> ef0e e740 	vabd.s8	q7, q7, q0
[^>]*> ef0e e742 	vabd.s8	q7, q7, q1
[^>]*> ef0e e744 	vabd.s8	q7, q7, q2
[^>]*> ef0e e748 	vabd.s8	q7, q7, q4
[^>]*> ef0e e74e 	vabd.s8	q7, q7, q7
[^>]*> ff10 0740 	vabd.u16	q0, q0, q0
[^>]*> ff10 0742 	vabd.u16	q0, q0, q1
[^>]*> ff10 0744 	vabd.u16	q0, q0, q2
[^>]*> ff10 0748 	vabd.u16	q0, q0, q4
[^>]*> ff10 074e 	vabd.u16	q0, q0, q7
[^>]*> ff12 0740 	vabd.u16	q0, q1, q0
[^>]*> ff12 0742 	vabd.u16	q0, q1, q1
[^>]*> ff12 0744 	vabd.u16	q0, q1, q2
[^>]*> ff12 0748 	vabd.u16	q0, q1, q4
[^>]*> ff12 074e 	vabd.u16	q0, q1, q7
[^>]*> ff14 0740 	vabd.u16	q0, q2, q0
[^>]*> ff14 0742 	vabd.u16	q0, q2, q1
[^>]*> ff14 0744 	vabd.u16	q0, q2, q2
[^>]*> ff14 0748 	vabd.u16	q0, q2, q4
[^>]*> ff14 074e 	vabd.u16	q0, q2, q7
[^>]*> ff18 0740 	vabd.u16	q0, q4, q0
[^>]*> ff18 0742 	vabd.u16	q0, q4, q1
[^>]*> ff18 0744 	vabd.u16	q0, q4, q2
[^>]*> ff18 0748 	vabd.u16	q0, q4, q4
[^>]*> ff18 074e 	vabd.u16	q0, q4, q7
[^>]*> ff1e 0740 	vabd.u16	q0, q7, q0
[^>]*> ff1e 0742 	vabd.u16	q0, q7, q1
[^>]*> ff1e 0744 	vabd.u16	q0, q7, q2
[^>]*> ff1e 0748 	vabd.u16	q0, q7, q4
[^>]*> ff1e 074e 	vabd.u16	q0, q7, q7
[^>]*> ff10 2740 	vabd.u16	q1, q0, q0
[^>]*> ff10 2742 	vabd.u16	q1, q0, q1
[^>]*> ff10 2744 	vabd.u16	q1, q0, q2
[^>]*> ff10 2748 	vabd.u16	q1, q0, q4
[^>]*> ff10 274e 	vabd.u16	q1, q0, q7
[^>]*> ff12 2740 	vabd.u16	q1, q1, q0
[^>]*> ff12 2742 	vabd.u16	q1, q1, q1
[^>]*> ff12 2744 	vabd.u16	q1, q1, q2
[^>]*> ff12 2748 	vabd.u16	q1, q1, q4
[^>]*> ff12 274e 	vabd.u16	q1, q1, q7
[^>]*> ff14 2740 	vabd.u16	q1, q2, q0
[^>]*> ff14 2742 	vabd.u16	q1, q2, q1
[^>]*> ff14 2744 	vabd.u16	q1, q2, q2
[^>]*> ff14 2748 	vabd.u16	q1, q2, q4
[^>]*> ff14 274e 	vabd.u16	q1, q2, q7
[^>]*> ff18 2740 	vabd.u16	q1, q4, q0
[^>]*> ff18 2742 	vabd.u16	q1, q4, q1
[^>]*> ff18 2744 	vabd.u16	q1, q4, q2
[^>]*> ff18 2748 	vabd.u16	q1, q4, q4
[^>]*> ff18 274e 	vabd.u16	q1, q4, q7
[^>]*> ff1e 2740 	vabd.u16	q1, q7, q0
[^>]*> ff1e 2742 	vabd.u16	q1, q7, q1
[^>]*> ff1e 2744 	vabd.u16	q1, q7, q2
[^>]*> ff1e 2748 	vabd.u16	q1, q7, q4
[^>]*> ff1e 274e 	vabd.u16	q1, q7, q7
[^>]*> ff10 4740 	vabd.u16	q2, q0, q0
[^>]*> ff10 4742 	vabd.u16	q2, q0, q1
[^>]*> ff10 4744 	vabd.u16	q2, q0, q2
[^>]*> ff10 4748 	vabd.u16	q2, q0, q4
[^>]*> ff10 474e 	vabd.u16	q2, q0, q7
[^>]*> ff12 4740 	vabd.u16	q2, q1, q0
[^>]*> ff12 4742 	vabd.u16	q2, q1, q1
[^>]*> ff12 4744 	vabd.u16	q2, q1, q2
[^>]*> ff12 4748 	vabd.u16	q2, q1, q4
[^>]*> ff12 474e 	vabd.u16	q2, q1, q7
[^>]*> ff14 4740 	vabd.u16	q2, q2, q0
[^>]*> ff14 4742 	vabd.u16	q2, q2, q1
[^>]*> ff14 4744 	vabd.u16	q2, q2, q2
[^>]*> ff14 4748 	vabd.u16	q2, q2, q4
[^>]*> ff14 474e 	vabd.u16	q2, q2, q7
[^>]*> ff18 4740 	vabd.u16	q2, q4, q0
[^>]*> ff18 4742 	vabd.u16	q2, q4, q1
[^>]*> ff18 4744 	vabd.u16	q2, q4, q2
[^>]*> ff18 4748 	vabd.u16	q2, q4, q4
[^>]*> ff18 474e 	vabd.u16	q2, q4, q7
[^>]*> ff1e 4740 	vabd.u16	q2, q7, q0
[^>]*> ff1e 4742 	vabd.u16	q2, q7, q1
[^>]*> ff1e 4744 	vabd.u16	q2, q7, q2
[^>]*> ff1e 4748 	vabd.u16	q2, q7, q4
[^>]*> ff1e 474e 	vabd.u16	q2, q7, q7
[^>]*> ff10 8740 	vabd.u16	q4, q0, q0
[^>]*> ff10 8742 	vabd.u16	q4, q0, q1
[^>]*> ff10 8744 	vabd.u16	q4, q0, q2
[^>]*> ff10 8748 	vabd.u16	q4, q0, q4
[^>]*> ff10 874e 	vabd.u16	q4, q0, q7
[^>]*> ff12 8740 	vabd.u16	q4, q1, q0
[^>]*> ff12 8742 	vabd.u16	q4, q1, q1
[^>]*> ff12 8744 	vabd.u16	q4, q1, q2
[^>]*> ff12 8748 	vabd.u16	q4, q1, q4
[^>]*> ff12 874e 	vabd.u16	q4, q1, q7
[^>]*> ff14 8740 	vabd.u16	q4, q2, q0
[^>]*> ff14 8742 	vabd.u16	q4, q2, q1
[^>]*> ff14 8744 	vabd.u16	q4, q2, q2
[^>]*> ff14 8748 	vabd.u16	q4, q2, q4
[^>]*> ff14 874e 	vabd.u16	q4, q2, q7
[^>]*> ff18 8740 	vabd.u16	q4, q4, q0
[^>]*> ff18 8742 	vabd.u16	q4, q4, q1
[^>]*> ff18 8744 	vabd.u16	q4, q4, q2
[^>]*> ff18 8748 	vabd.u16	q4, q4, q4
[^>]*> ff18 874e 	vabd.u16	q4, q4, q7
[^>]*> ff1e 8740 	vabd.u16	q4, q7, q0
[^>]*> ff1e 8742 	vabd.u16	q4, q7, q1
[^>]*> ff1e 8744 	vabd.u16	q4, q7, q2
[^>]*> ff1e 8748 	vabd.u16	q4, q7, q4
[^>]*> ff1e 874e 	vabd.u16	q4, q7, q7
[^>]*> ff10 e740 	vabd.u16	q7, q0, q0
[^>]*> ff10 e742 	vabd.u16	q7, q0, q1
[^>]*> ff10 e744 	vabd.u16	q7, q0, q2
[^>]*> ff10 e748 	vabd.u16	q7, q0, q4
[^>]*> ff10 e74e 	vabd.u16	q7, q0, q7
[^>]*> ff12 e740 	vabd.u16	q7, q1, q0
[^>]*> ff12 e742 	vabd.u16	q7, q1, q1
[^>]*> ff12 e744 	vabd.u16	q7, q1, q2
[^>]*> ff12 e748 	vabd.u16	q7, q1, q4
[^>]*> ff12 e74e 	vabd.u16	q7, q1, q7
[^>]*> ff14 e740 	vabd.u16	q7, q2, q0
[^>]*> ff14 e742 	vabd.u16	q7, q2, q1
[^>]*> ff14 e744 	vabd.u16	q7, q2, q2
[^>]*> ff14 e748 	vabd.u16	q7, q2, q4
[^>]*> ff14 e74e 	vabd.u16	q7, q2, q7
[^>]*> ff18 e740 	vabd.u16	q7, q4, q0
[^>]*> ff18 e742 	vabd.u16	q7, q4, q1
[^>]*> ff18 e744 	vabd.u16	q7, q4, q2
[^>]*> ff18 e748 	vabd.u16	q7, q4, q4
[^>]*> ff18 e74e 	vabd.u16	q7, q4, q7
[^>]*> ff1e e740 	vabd.u16	q7, q7, q0
[^>]*> ff1e e742 	vabd.u16	q7, q7, q1
[^>]*> ff1e e744 	vabd.u16	q7, q7, q2
[^>]*> ff1e e748 	vabd.u16	q7, q7, q4
[^>]*> ff1e e74e 	vabd.u16	q7, q7, q7
[^>]*> ef10 0740 	vabd.s16	q0, q0, q0
[^>]*> ef10 0742 	vabd.s16	q0, q0, q1
[^>]*> ef10 0744 	vabd.s16	q0, q0, q2
[^>]*> ef10 0748 	vabd.s16	q0, q0, q4
[^>]*> ef10 074e 	vabd.s16	q0, q0, q7
[^>]*> ef12 0740 	vabd.s16	q0, q1, q0
[^>]*> ef12 0742 	vabd.s16	q0, q1, q1
[^>]*> ef12 0744 	vabd.s16	q0, q1, q2
[^>]*> ef12 0748 	vabd.s16	q0, q1, q4
[^>]*> ef12 074e 	vabd.s16	q0, q1, q7
[^>]*> ef14 0740 	vabd.s16	q0, q2, q0
[^>]*> ef14 0742 	vabd.s16	q0, q2, q1
[^>]*> ef14 0744 	vabd.s16	q0, q2, q2
[^>]*> ef14 0748 	vabd.s16	q0, q2, q4
[^>]*> ef14 074e 	vabd.s16	q0, q2, q7
[^>]*> ef18 0740 	vabd.s16	q0, q4, q0
[^>]*> ef18 0742 	vabd.s16	q0, q4, q1
[^>]*> ef18 0744 	vabd.s16	q0, q4, q2
[^>]*> ef18 0748 	vabd.s16	q0, q4, q4
[^>]*> ef18 074e 	vabd.s16	q0, q4, q7
[^>]*> ef1e 0740 	vabd.s16	q0, q7, q0
[^>]*> ef1e 0742 	vabd.s16	q0, q7, q1
[^>]*> ef1e 0744 	vabd.s16	q0, q7, q2
[^>]*> ef1e 0748 	vabd.s16	q0, q7, q4
[^>]*> ef1e 074e 	vabd.s16	q0, q7, q7
[^>]*> ef10 2740 	vabd.s16	q1, q0, q0
[^>]*> ef10 2742 	vabd.s16	q1, q0, q1
[^>]*> ef10 2744 	vabd.s16	q1, q0, q2
[^>]*> ef10 2748 	vabd.s16	q1, q0, q4
[^>]*> ef10 274e 	vabd.s16	q1, q0, q7
[^>]*> ef12 2740 	vabd.s16	q1, q1, q0
[^>]*> ef12 2742 	vabd.s16	q1, q1, q1
[^>]*> ef12 2744 	vabd.s16	q1, q1, q2
[^>]*> ef12 2748 	vabd.s16	q1, q1, q4
[^>]*> ef12 274e 	vabd.s16	q1, q1, q7
[^>]*> ef14 2740 	vabd.s16	q1, q2, q0
[^>]*> ef14 2742 	vabd.s16	q1, q2, q1
[^>]*> ef14 2744 	vabd.s16	q1, q2, q2
[^>]*> ef14 2748 	vabd.s16	q1, q2, q4
[^>]*> ef14 274e 	vabd.s16	q1, q2, q7
[^>]*> ef18 2740 	vabd.s16	q1, q4, q0
[^>]*> ef18 2742 	vabd.s16	q1, q4, q1
[^>]*> ef18 2744 	vabd.s16	q1, q4, q2
[^>]*> ef18 2748 	vabd.s16	q1, q4, q4
[^>]*> ef18 274e 	vabd.s16	q1, q4, q7
[^>]*> ef1e 2740 	vabd.s16	q1, q7, q0
[^>]*> ef1e 2742 	vabd.s16	q1, q7, q1
[^>]*> ef1e 2744 	vabd.s16	q1, q7, q2
[^>]*> ef1e 2748 	vabd.s16	q1, q7, q4
[^>]*> ef1e 274e 	vabd.s16	q1, q7, q7
[^>]*> ef10 4740 	vabd.s16	q2, q0, q0
[^>]*> ef10 4742 	vabd.s16	q2, q0, q1
[^>]*> ef10 4744 	vabd.s16	q2, q0, q2
[^>]*> ef10 4748 	vabd.s16	q2, q0, q4
[^>]*> ef10 474e 	vabd.s16	q2, q0, q7
[^>]*> ef12 4740 	vabd.s16	q2, q1, q0
[^>]*> ef12 4742 	vabd.s16	q2, q1, q1
[^>]*> ef12 4744 	vabd.s16	q2, q1, q2
[^>]*> ef12 4748 	vabd.s16	q2, q1, q4
[^>]*> ef12 474e 	vabd.s16	q2, q1, q7
[^>]*> ef14 4740 	vabd.s16	q2, q2, q0
[^>]*> ef14 4742 	vabd.s16	q2, q2, q1
[^>]*> ef14 4744 	vabd.s16	q2, q2, q2
[^>]*> ef14 4748 	vabd.s16	q2, q2, q4
[^>]*> ef14 474e 	vabd.s16	q2, q2, q7
[^>]*> ef18 4740 	vabd.s16	q2, q4, q0
[^>]*> ef18 4742 	vabd.s16	q2, q4, q1
[^>]*> ef18 4744 	vabd.s16	q2, q4, q2
[^>]*> ef18 4748 	vabd.s16	q2, q4, q4
[^>]*> ef18 474e 	vabd.s16	q2, q4, q7
[^>]*> ef1e 4740 	vabd.s16	q2, q7, q0
[^>]*> ef1e 4742 	vabd.s16	q2, q7, q1
[^>]*> ef1e 4744 	vabd.s16	q2, q7, q2
[^>]*> ef1e 4748 	vabd.s16	q2, q7, q4
[^>]*> ef1e 474e 	vabd.s16	q2, q7, q7
[^>]*> ef10 8740 	vabd.s16	q4, q0, q0
[^>]*> ef10 8742 	vabd.s16	q4, q0, q1
[^>]*> ef10 8744 	vabd.s16	q4, q0, q2
[^>]*> ef10 8748 	vabd.s16	q4, q0, q4
[^>]*> ef10 874e 	vabd.s16	q4, q0, q7
[^>]*> ef12 8740 	vabd.s16	q4, q1, q0
[^>]*> ef12 8742 	vabd.s16	q4, q1, q1
[^>]*> ef12 8744 	vabd.s16	q4, q1, q2
[^>]*> ef12 8748 	vabd.s16	q4, q1, q4
[^>]*> ef12 874e 	vabd.s16	q4, q1, q7
[^>]*> ef14 8740 	vabd.s16	q4, q2, q0
[^>]*> ef14 8742 	vabd.s16	q4, q2, q1
[^>]*> ef14 8744 	vabd.s16	q4, q2, q2
[^>]*> ef14 8748 	vabd.s16	q4, q2, q4
[^>]*> ef14 874e 	vabd.s16	q4, q2, q7
[^>]*> ef18 8740 	vabd.s16	q4, q4, q0
[^>]*> ef18 8742 	vabd.s16	q4, q4, q1
[^>]*> ef18 8744 	vabd.s16	q4, q4, q2
[^>]*> ef18 8748 	vabd.s16	q4, q4, q4
[^>]*> ef18 874e 	vabd.s16	q4, q4, q7
[^>]*> ef1e 8740 	vabd.s16	q4, q7, q0
[^>]*> ef1e 8742 	vabd.s16	q4, q7, q1
[^>]*> ef1e 8744 	vabd.s16	q4, q7, q2
[^>]*> ef1e 8748 	vabd.s16	q4, q7, q4
[^>]*> ef1e 874e 	vabd.s16	q4, q7, q7
[^>]*> ef10 e740 	vabd.s16	q7, q0, q0
[^>]*> ef10 e742 	vabd.s16	q7, q0, q1
[^>]*> ef10 e744 	vabd.s16	q7, q0, q2
[^>]*> ef10 e748 	vabd.s16	q7, q0, q4
[^>]*> ef10 e74e 	vabd.s16	q7, q0, q7
[^>]*> ef12 e740 	vabd.s16	q7, q1, q0
[^>]*> ef12 e742 	vabd.s16	q7, q1, q1
[^>]*> ef12 e744 	vabd.s16	q7, q1, q2
[^>]*> ef12 e748 	vabd.s16	q7, q1, q4
[^>]*> ef12 e74e 	vabd.s16	q7, q1, q7
[^>]*> ef14 e740 	vabd.s16	q7, q2, q0
[^>]*> ef14 e742 	vabd.s16	q7, q2, q1
[^>]*> ef14 e744 	vabd.s16	q7, q2, q2
[^>]*> ef14 e748 	vabd.s16	q7, q2, q4
[^>]*> ef14 e74e 	vabd.s16	q7, q2, q7
[^>]*> ef18 e740 	vabd.s16	q7, q4, q0
[^>]*> ef18 e742 	vabd.s16	q7, q4, q1
[^>]*> ef18 e744 	vabd.s16	q7, q4, q2
[^>]*> ef18 e748 	vabd.s16	q7, q4, q4
[^>]*> ef18 e74e 	vabd.s16	q7, q4, q7
[^>]*> ef1e e740 	vabd.s16	q7, q7, q0
[^>]*> ef1e e742 	vabd.s16	q7, q7, q1
[^>]*> ef1e e744 	vabd.s16	q7, q7, q2
[^>]*> ef1e e748 	vabd.s16	q7, q7, q4
[^>]*> ef1e e74e 	vabd.s16	q7, q7, q7
[^>]*> ff20 0740 	vabd.u32	q0, q0, q0
[^>]*> ff20 0742 	vabd.u32	q0, q0, q1
[^>]*> ff20 0744 	vabd.u32	q0, q0, q2
[^>]*> ff20 0748 	vabd.u32	q0, q0, q4
[^>]*> ff20 074e 	vabd.u32	q0, q0, q7
[^>]*> ff22 0740 	vabd.u32	q0, q1, q0
[^>]*> ff22 0742 	vabd.u32	q0, q1, q1
[^>]*> ff22 0744 	vabd.u32	q0, q1, q2
[^>]*> ff22 0748 	vabd.u32	q0, q1, q4
[^>]*> ff22 074e 	vabd.u32	q0, q1, q7
[^>]*> ff24 0740 	vabd.u32	q0, q2, q0
[^>]*> ff24 0742 	vabd.u32	q0, q2, q1
[^>]*> ff24 0744 	vabd.u32	q0, q2, q2
[^>]*> ff24 0748 	vabd.u32	q0, q2, q4
[^>]*> ff24 074e 	vabd.u32	q0, q2, q7
[^>]*> ff28 0740 	vabd.u32	q0, q4, q0
[^>]*> ff28 0742 	vabd.u32	q0, q4, q1
[^>]*> ff28 0744 	vabd.u32	q0, q4, q2
[^>]*> ff28 0748 	vabd.u32	q0, q4, q4
[^>]*> ff28 074e 	vabd.u32	q0, q4, q7
[^>]*> ff2e 0740 	vabd.u32	q0, q7, q0
[^>]*> ff2e 0742 	vabd.u32	q0, q7, q1
[^>]*> ff2e 0744 	vabd.u32	q0, q7, q2
[^>]*> ff2e 0748 	vabd.u32	q0, q7, q4
[^>]*> ff2e 074e 	vabd.u32	q0, q7, q7
[^>]*> ff20 2740 	vabd.u32	q1, q0, q0
[^>]*> ff20 2742 	vabd.u32	q1, q0, q1
[^>]*> ff20 2744 	vabd.u32	q1, q0, q2
[^>]*> ff20 2748 	vabd.u32	q1, q0, q4
[^>]*> ff20 274e 	vabd.u32	q1, q0, q7
[^>]*> ff22 2740 	vabd.u32	q1, q1, q0
[^>]*> ff22 2742 	vabd.u32	q1, q1, q1
[^>]*> ff22 2744 	vabd.u32	q1, q1, q2
[^>]*> ff22 2748 	vabd.u32	q1, q1, q4
[^>]*> ff22 274e 	vabd.u32	q1, q1, q7
[^>]*> ff24 2740 	vabd.u32	q1, q2, q0
[^>]*> ff24 2742 	vabd.u32	q1, q2, q1
[^>]*> ff24 2744 	vabd.u32	q1, q2, q2
[^>]*> ff24 2748 	vabd.u32	q1, q2, q4
[^>]*> ff24 274e 	vabd.u32	q1, q2, q7
[^>]*> ff28 2740 	vabd.u32	q1, q4, q0
[^>]*> ff28 2742 	vabd.u32	q1, q4, q1
[^>]*> ff28 2744 	vabd.u32	q1, q4, q2
[^>]*> ff28 2748 	vabd.u32	q1, q4, q4
[^>]*> ff28 274e 	vabd.u32	q1, q4, q7
[^>]*> ff2e 2740 	vabd.u32	q1, q7, q0
[^>]*> ff2e 2742 	vabd.u32	q1, q7, q1
[^>]*> ff2e 2744 	vabd.u32	q1, q7, q2
[^>]*> ff2e 2748 	vabd.u32	q1, q7, q4
[^>]*> ff2e 274e 	vabd.u32	q1, q7, q7
[^>]*> ff20 4740 	vabd.u32	q2, q0, q0
[^>]*> ff20 4742 	vabd.u32	q2, q0, q1
[^>]*> ff20 4744 	vabd.u32	q2, q0, q2
[^>]*> ff20 4748 	vabd.u32	q2, q0, q4
[^>]*> ff20 474e 	vabd.u32	q2, q0, q7
[^>]*> ff22 4740 	vabd.u32	q2, q1, q0
[^>]*> ff22 4742 	vabd.u32	q2, q1, q1
[^>]*> ff22 4744 	vabd.u32	q2, q1, q2
[^>]*> ff22 4748 	vabd.u32	q2, q1, q4
[^>]*> ff22 474e 	vabd.u32	q2, q1, q7
[^>]*> ff24 4740 	vabd.u32	q2, q2, q0
[^>]*> ff24 4742 	vabd.u32	q2, q2, q1
[^>]*> ff24 4744 	vabd.u32	q2, q2, q2
[^>]*> ff24 4748 	vabd.u32	q2, q2, q4
[^>]*> ff24 474e 	vabd.u32	q2, q2, q7
[^>]*> ff28 4740 	vabd.u32	q2, q4, q0
[^>]*> ff28 4742 	vabd.u32	q2, q4, q1
[^>]*> ff28 4744 	vabd.u32	q2, q4, q2
[^>]*> ff28 4748 	vabd.u32	q2, q4, q4
[^>]*> ff28 474e 	vabd.u32	q2, q4, q7
[^>]*> ff2e 4740 	vabd.u32	q2, q7, q0
[^>]*> ff2e 4742 	vabd.u32	q2, q7, q1
[^>]*> ff2e 4744 	vabd.u32	q2, q7, q2
[^>]*> ff2e 4748 	vabd.u32	q2, q7, q4
[^>]*> ff2e 474e 	vabd.u32	q2, q7, q7
[^>]*> ff20 8740 	vabd.u32	q4, q0, q0
[^>]*> ff20 8742 	vabd.u32	q4, q0, q1
[^>]*> ff20 8744 	vabd.u32	q4, q0, q2
[^>]*> ff20 8748 	vabd.u32	q4, q0, q4
[^>]*> ff20 874e 	vabd.u32	q4, q0, q7
[^>]*> ff22 8740 	vabd.u32	q4, q1, q0
[^>]*> ff22 8742 	vabd.u32	q4, q1, q1
[^>]*> ff22 8744 	vabd.u32	q4, q1, q2
[^>]*> ff22 8748 	vabd.u32	q4, q1, q4
[^>]*> ff22 874e 	vabd.u32	q4, q1, q7
[^>]*> ff24 8740 	vabd.u32	q4, q2, q0
[^>]*> ff24 8742 	vabd.u32	q4, q2, q1
[^>]*> ff24 8744 	vabd.u32	q4, q2, q2
[^>]*> ff24 8748 	vabd.u32	q4, q2, q4
[^>]*> ff24 874e 	vabd.u32	q4, q2, q7
[^>]*> ff28 8740 	vabd.u32	q4, q4, q0
[^>]*> ff28 8742 	vabd.u32	q4, q4, q1
[^>]*> ff28 8744 	vabd.u32	q4, q4, q2
[^>]*> ff28 8748 	vabd.u32	q4, q4, q4
[^>]*> ff28 874e 	vabd.u32	q4, q4, q7
[^>]*> ff2e 8740 	vabd.u32	q4, q7, q0
[^>]*> ff2e 8742 	vabd.u32	q4, q7, q1
[^>]*> ff2e 8744 	vabd.u32	q4, q7, q2
[^>]*> ff2e 8748 	vabd.u32	q4, q7, q4
[^>]*> ff2e 874e 	vabd.u32	q4, q7, q7
[^>]*> ff20 e740 	vabd.u32	q7, q0, q0
[^>]*> ff20 e742 	vabd.u32	q7, q0, q1
[^>]*> ff20 e744 	vabd.u32	q7, q0, q2
[^>]*> ff20 e748 	vabd.u32	q7, q0, q4
[^>]*> ff20 e74e 	vabd.u32	q7, q0, q7
[^>]*> ff22 e740 	vabd.u32	q7, q1, q0
[^>]*> ff22 e742 	vabd.u32	q7, q1, q1
[^>]*> ff22 e744 	vabd.u32	q7, q1, q2
[^>]*> ff22 e748 	vabd.u32	q7, q1, q4
[^>]*> ff22 e74e 	vabd.u32	q7, q1, q7
[^>]*> ff24 e740 	vabd.u32	q7, q2, q0
[^>]*> ff24 e742 	vabd.u32	q7, q2, q1
[^>]*> ff24 e744 	vabd.u32	q7, q2, q2
[^>]*> ff24 e748 	vabd.u32	q7, q2, q4
[^>]*> ff24 e74e 	vabd.u32	q7, q2, q7
[^>]*> ff28 e740 	vabd.u32	q7, q4, q0
[^>]*> ff28 e742 	vabd.u32	q7, q4, q1
[^>]*> ff28 e744 	vabd.u32	q7, q4, q2
[^>]*> ff28 e748 	vabd.u32	q7, q4, q4
[^>]*> ff28 e74e 	vabd.u32	q7, q4, q7
[^>]*> ff2e e740 	vabd.u32	q7, q7, q0
[^>]*> ff2e e742 	vabd.u32	q7, q7, q1
[^>]*> ff2e e744 	vabd.u32	q7, q7, q2
[^>]*> ff2e e748 	vabd.u32	q7, q7, q4
[^>]*> ff2e e74e 	vabd.u32	q7, q7, q7
[^>]*> ef20 0740 	vabd.s32	q0, q0, q0
[^>]*> ef20 0742 	vabd.s32	q0, q0, q1
[^>]*> ef20 0744 	vabd.s32	q0, q0, q2
[^>]*> ef20 0748 	vabd.s32	q0, q0, q4
[^>]*> ef20 074e 	vabd.s32	q0, q0, q7
[^>]*> ef22 0740 	vabd.s32	q0, q1, q0
[^>]*> ef22 0742 	vabd.s32	q0, q1, q1
[^>]*> ef22 0744 	vabd.s32	q0, q1, q2
[^>]*> ef22 0748 	vabd.s32	q0, q1, q4
[^>]*> ef22 074e 	vabd.s32	q0, q1, q7
[^>]*> ef24 0740 	vabd.s32	q0, q2, q0
[^>]*> ef24 0742 	vabd.s32	q0, q2, q1
[^>]*> ef24 0744 	vabd.s32	q0, q2, q2
[^>]*> ef24 0748 	vabd.s32	q0, q2, q4
[^>]*> ef24 074e 	vabd.s32	q0, q2, q7
[^>]*> ef28 0740 	vabd.s32	q0, q4, q0
[^>]*> ef28 0742 	vabd.s32	q0, q4, q1
[^>]*> ef28 0744 	vabd.s32	q0, q4, q2
[^>]*> ef28 0748 	vabd.s32	q0, q4, q4
[^>]*> ef28 074e 	vabd.s32	q0, q4, q7
[^>]*> ef2e 0740 	vabd.s32	q0, q7, q0
[^>]*> ef2e 0742 	vabd.s32	q0, q7, q1
[^>]*> ef2e 0744 	vabd.s32	q0, q7, q2
[^>]*> ef2e 0748 	vabd.s32	q0, q7, q4
[^>]*> ef2e 074e 	vabd.s32	q0, q7, q7
[^>]*> ef20 2740 	vabd.s32	q1, q0, q0
[^>]*> ef20 2742 	vabd.s32	q1, q0, q1
[^>]*> ef20 2744 	vabd.s32	q1, q0, q2
[^>]*> ef20 2748 	vabd.s32	q1, q0, q4
[^>]*> ef20 274e 	vabd.s32	q1, q0, q7
[^>]*> ef22 2740 	vabd.s32	q1, q1, q0
[^>]*> ef22 2742 	vabd.s32	q1, q1, q1
[^>]*> ef22 2744 	vabd.s32	q1, q1, q2
[^>]*> ef22 2748 	vabd.s32	q1, q1, q4
[^>]*> ef22 274e 	vabd.s32	q1, q1, q7
[^>]*> ef24 2740 	vabd.s32	q1, q2, q0
[^>]*> ef24 2742 	vabd.s32	q1, q2, q1
[^>]*> ef24 2744 	vabd.s32	q1, q2, q2
[^>]*> ef24 2748 	vabd.s32	q1, q2, q4
[^>]*> ef24 274e 	vabd.s32	q1, q2, q7
[^>]*> ef28 2740 	vabd.s32	q1, q4, q0
[^>]*> ef28 2742 	vabd.s32	q1, q4, q1
[^>]*> ef28 2744 	vabd.s32	q1, q4, q2
[^>]*> ef28 2748 	vabd.s32	q1, q4, q4
[^>]*> ef28 274e 	vabd.s32	q1, q4, q7
[^>]*> ef2e 2740 	vabd.s32	q1, q7, q0
[^>]*> ef2e 2742 	vabd.s32	q1, q7, q1
[^>]*> ef2e 2744 	vabd.s32	q1, q7, q2
[^>]*> ef2e 2748 	vabd.s32	q1, q7, q4
[^>]*> ef2e 274e 	vabd.s32	q1, q7, q7
[^>]*> ef20 4740 	vabd.s32	q2, q0, q0
[^>]*> ef20 4742 	vabd.s32	q2, q0, q1
[^>]*> ef20 4744 	vabd.s32	q2, q0, q2
[^>]*> ef20 4748 	vabd.s32	q2, q0, q4
[^>]*> ef20 474e 	vabd.s32	q2, q0, q7
[^>]*> ef22 4740 	vabd.s32	q2, q1, q0
[^>]*> ef22 4742 	vabd.s32	q2, q1, q1
[^>]*> ef22 4744 	vabd.s32	q2, q1, q2
[^>]*> ef22 4748 	vabd.s32	q2, q1, q4
[^>]*> ef22 474e 	vabd.s32	q2, q1, q7
[^>]*> ef24 4740 	vabd.s32	q2, q2, q0
[^>]*> ef24 4742 	vabd.s32	q2, q2, q1
[^>]*> ef24 4744 	vabd.s32	q2, q2, q2
[^>]*> ef24 4748 	vabd.s32	q2, q2, q4
[^>]*> ef24 474e 	vabd.s32	q2, q2, q7
[^>]*> ef28 4740 	vabd.s32	q2, q4, q0
[^>]*> ef28 4742 	vabd.s32	q2, q4, q1
[^>]*> ef28 4744 	vabd.s32	q2, q4, q2
[^>]*> ef28 4748 	vabd.s32	q2, q4, q4
[^>]*> ef28 474e 	vabd.s32	q2, q4, q7
[^>]*> ef2e 4740 	vabd.s32	q2, q7, q0
[^>]*> ef2e 4742 	vabd.s32	q2, q7, q1
[^>]*> ef2e 4744 	vabd.s32	q2, q7, q2
[^>]*> ef2e 4748 	vabd.s32	q2, q7, q4
[^>]*> ef2e 474e 	vabd.s32	q2, q7, q7
[^>]*> ef20 8740 	vabd.s32	q4, q0, q0
[^>]*> ef20 8742 	vabd.s32	q4, q0, q1
[^>]*> ef20 8744 	vabd.s32	q4, q0, q2
[^>]*> ef20 8748 	vabd.s32	q4, q0, q4
[^>]*> ef20 874e 	vabd.s32	q4, q0, q7
[^>]*> ef22 8740 	vabd.s32	q4, q1, q0
[^>]*> ef22 8742 	vabd.s32	q4, q1, q1
[^>]*> ef22 8744 	vabd.s32	q4, q1, q2
[^>]*> ef22 8748 	vabd.s32	q4, q1, q4
[^>]*> ef22 874e 	vabd.s32	q4, q1, q7
[^>]*> ef24 8740 	vabd.s32	q4, q2, q0
[^>]*> ef24 8742 	vabd.s32	q4, q2, q1
[^>]*> ef24 8744 	vabd.s32	q4, q2, q2
[^>]*> ef24 8748 	vabd.s32	q4, q2, q4
[^>]*> ef24 874e 	vabd.s32	q4, q2, q7
[^>]*> ef28 8740 	vabd.s32	q4, q4, q0
[^>]*> ef28 8742 	vabd.s32	q4, q4, q1
[^>]*> ef28 8744 	vabd.s32	q4, q4, q2
[^>]*> ef28 8748 	vabd.s32	q4, q4, q4
[^>]*> ef28 874e 	vabd.s32	q4, q4, q7
[^>]*> ef2e 8740 	vabd.s32	q4, q7, q0
[^>]*> ef2e 8742 	vabd.s32	q4, q7, q1
[^>]*> ef2e 8744 	vabd.s32	q4, q7, q2
[^>]*> ef2e 8748 	vabd.s32	q4, q7, q4
[^>]*> ef2e 874e 	vabd.s32	q4, q7, q7
[^>]*> ef20 e740 	vabd.s32	q7, q0, q0
[^>]*> ef20 e742 	vabd.s32	q7, q0, q1
[^>]*> ef20 e744 	vabd.s32	q7, q0, q2
[^>]*> ef20 e748 	vabd.s32	q7, q0, q4
[^>]*> ef20 e74e 	vabd.s32	q7, q0, q7
[^>]*> ef22 e740 	vabd.s32	q7, q1, q0
[^>]*> ef22 e742 	vabd.s32	q7, q1, q1
[^>]*> ef22 e744 	vabd.s32	q7, q1, q2
[^>]*> ef22 e748 	vabd.s32	q7, q1, q4
[^>]*> ef22 e74e 	vabd.s32	q7, q1, q7
[^>]*> ef24 e740 	vabd.s32	q7, q2, q0
[^>]*> ef24 e742 	vabd.s32	q7, q2, q1
[^>]*> ef24 e744 	vabd.s32	q7, q2, q2
[^>]*> ef24 e748 	vabd.s32	q7, q2, q4
[^>]*> ef24 e74e 	vabd.s32	q7, q2, q7
[^>]*> ef28 e740 	vabd.s32	q7, q4, q0
[^>]*> ef28 e742 	vabd.s32	q7, q4, q1
[^>]*> ef28 e744 	vabd.s32	q7, q4, q2
[^>]*> ef28 e748 	vabd.s32	q7, q4, q4
[^>]*> ef28 e74e 	vabd.s32	q7, q4, q7
[^>]*> ef2e e740 	vabd.s32	q7, q7, q0
[^>]*> ef2e e742 	vabd.s32	q7, q7, q1
[^>]*> ef2e e744 	vabd.s32	q7, q7, q2
[^>]*> ef2e e748 	vabd.s32	q7, q7, q4
[^>]*> ef2e e74e 	vabd.s32	q7, q7, q7
[^>]*> ff30 0d40 	vabd.f16	q0, q0, q0
[^>]*> ff30 0d42 	vabd.f16	q0, q0, q1
[^>]*> ff30 0d44 	vabd.f16	q0, q0, q2
[^>]*> ff30 0d48 	vabd.f16	q0, q0, q4
[^>]*> ff30 0d4e 	vabd.f16	q0, q0, q7
[^>]*> ff32 0d40 	vabd.f16	q0, q1, q0
[^>]*> ff32 0d42 	vabd.f16	q0, q1, q1
[^>]*> ff32 0d44 	vabd.f16	q0, q1, q2
[^>]*> ff32 0d48 	vabd.f16	q0, q1, q4
[^>]*> ff32 0d4e 	vabd.f16	q0, q1, q7
[^>]*> ff34 0d40 	vabd.f16	q0, q2, q0
[^>]*> ff34 0d42 	vabd.f16	q0, q2, q1
[^>]*> ff34 0d44 	vabd.f16	q0, q2, q2
[^>]*> ff34 0d48 	vabd.f16	q0, q2, q4
[^>]*> ff34 0d4e 	vabd.f16	q0, q2, q7
[^>]*> ff38 0d40 	vabd.f16	q0, q4, q0
[^>]*> ff38 0d42 	vabd.f16	q0, q4, q1
[^>]*> ff38 0d44 	vabd.f16	q0, q4, q2
[^>]*> ff38 0d48 	vabd.f16	q0, q4, q4
[^>]*> ff38 0d4e 	vabd.f16	q0, q4, q7
[^>]*> ff3e 0d40 	vabd.f16	q0, q7, q0
[^>]*> ff3e 0d42 	vabd.f16	q0, q7, q1
[^>]*> ff3e 0d44 	vabd.f16	q0, q7, q2
[^>]*> ff3e 0d48 	vabd.f16	q0, q7, q4
[^>]*> ff3e 0d4e 	vabd.f16	q0, q7, q7
[^>]*> ff30 2d40 	vabd.f16	q1, q0, q0
[^>]*> ff30 2d42 	vabd.f16	q1, q0, q1
[^>]*> ff30 2d44 	vabd.f16	q1, q0, q2
[^>]*> ff30 2d48 	vabd.f16	q1, q0, q4
[^>]*> ff30 2d4e 	vabd.f16	q1, q0, q7
[^>]*> ff32 2d40 	vabd.f16	q1, q1, q0
[^>]*> ff32 2d42 	vabd.f16	q1, q1, q1
[^>]*> ff32 2d44 	vabd.f16	q1, q1, q2
[^>]*> ff32 2d48 	vabd.f16	q1, q1, q4
[^>]*> ff32 2d4e 	vabd.f16	q1, q1, q7
[^>]*> ff34 2d40 	vabd.f16	q1, q2, q0
[^>]*> ff34 2d42 	vabd.f16	q1, q2, q1
[^>]*> ff34 2d44 	vabd.f16	q1, q2, q2
[^>]*> ff34 2d48 	vabd.f16	q1, q2, q4
[^>]*> ff34 2d4e 	vabd.f16	q1, q2, q7
[^>]*> ff38 2d40 	vabd.f16	q1, q4, q0
[^>]*> ff38 2d42 	vabd.f16	q1, q4, q1
[^>]*> ff38 2d44 	vabd.f16	q1, q4, q2
[^>]*> ff38 2d48 	vabd.f16	q1, q4, q4
[^>]*> ff38 2d4e 	vabd.f16	q1, q4, q7
[^>]*> ff3e 2d40 	vabd.f16	q1, q7, q0
[^>]*> ff3e 2d42 	vabd.f16	q1, q7, q1
[^>]*> ff3e 2d44 	vabd.f16	q1, q7, q2
[^>]*> ff3e 2d48 	vabd.f16	q1, q7, q4
[^>]*> ff3e 2d4e 	vabd.f16	q1, q7, q7
[^>]*> ff30 4d40 	vabd.f16	q2, q0, q0
[^>]*> ff30 4d42 	vabd.f16	q2, q0, q1
[^>]*> ff30 4d44 	vabd.f16	q2, q0, q2
[^>]*> ff30 4d48 	vabd.f16	q2, q0, q4
[^>]*> ff30 4d4e 	vabd.f16	q2, q0, q7
[^>]*> ff32 4d40 	vabd.f16	q2, q1, q0
[^>]*> ff32 4d42 	vabd.f16	q2, q1, q1
[^>]*> ff32 4d44 	vabd.f16	q2, q1, q2
[^>]*> ff32 4d48 	vabd.f16	q2, q1, q4
[^>]*> ff32 4d4e 	vabd.f16	q2, q1, q7
[^>]*> ff34 4d40 	vabd.f16	q2, q2, q0
[^>]*> ff34 4d42 	vabd.f16	q2, q2, q1
[^>]*> ff34 4d44 	vabd.f16	q2, q2, q2
[^>]*> ff34 4d48 	vabd.f16	q2, q2, q4
[^>]*> ff34 4d4e 	vabd.f16	q2, q2, q7
[^>]*> ff38 4d40 	vabd.f16	q2, q4, q0
[^>]*> ff38 4d42 	vabd.f16	q2, q4, q1
[^>]*> ff38 4d44 	vabd.f16	q2, q4, q2
[^>]*> ff38 4d48 	vabd.f16	q2, q4, q4
[^>]*> ff38 4d4e 	vabd.f16	q2, q4, q7
[^>]*> ff3e 4d40 	vabd.f16	q2, q7, q0
[^>]*> ff3e 4d42 	vabd.f16	q2, q7, q1
[^>]*> ff3e 4d44 	vabd.f16	q2, q7, q2
[^>]*> ff3e 4d48 	vabd.f16	q2, q7, q4
[^>]*> ff3e 4d4e 	vabd.f16	q2, q7, q7
[^>]*> ff30 8d40 	vabd.f16	q4, q0, q0
[^>]*> ff30 8d42 	vabd.f16	q4, q0, q1
[^>]*> ff30 8d44 	vabd.f16	q4, q0, q2
[^>]*> ff30 8d48 	vabd.f16	q4, q0, q4
[^>]*> ff30 8d4e 	vabd.f16	q4, q0, q7
[^>]*> ff32 8d40 	vabd.f16	q4, q1, q0
[^>]*> ff32 8d42 	vabd.f16	q4, q1, q1
[^>]*> ff32 8d44 	vabd.f16	q4, q1, q2
[^>]*> ff32 8d48 	vabd.f16	q4, q1, q4
[^>]*> ff32 8d4e 	vabd.f16	q4, q1, q7
[^>]*> ff34 8d40 	vabd.f16	q4, q2, q0
[^>]*> ff34 8d42 	vabd.f16	q4, q2, q1
[^>]*> ff34 8d44 	vabd.f16	q4, q2, q2
[^>]*> ff34 8d48 	vabd.f16	q4, q2, q4
[^>]*> ff34 8d4e 	vabd.f16	q4, q2, q7
[^>]*> ff38 8d40 	vabd.f16	q4, q4, q0
[^>]*> ff38 8d42 	vabd.f16	q4, q4, q1
[^>]*> ff38 8d44 	vabd.f16	q4, q4, q2
[^>]*> ff38 8d48 	vabd.f16	q4, q4, q4
[^>]*> ff38 8d4e 	vabd.f16	q4, q4, q7
[^>]*> ff3e 8d40 	vabd.f16	q4, q7, q0
[^>]*> ff3e 8d42 	vabd.f16	q4, q7, q1
[^>]*> ff3e 8d44 	vabd.f16	q4, q7, q2
[^>]*> ff3e 8d48 	vabd.f16	q4, q7, q4
[^>]*> ff3e 8d4e 	vabd.f16	q4, q7, q7
[^>]*> ff30 ed40 	vabd.f16	q7, q0, q0
[^>]*> ff30 ed42 	vabd.f16	q7, q0, q1
[^>]*> ff30 ed44 	vabd.f16	q7, q0, q2
[^>]*> ff30 ed48 	vabd.f16	q7, q0, q4
[^>]*> ff30 ed4e 	vabd.f16	q7, q0, q7
[^>]*> ff32 ed40 	vabd.f16	q7, q1, q0
[^>]*> ff32 ed42 	vabd.f16	q7, q1, q1
[^>]*> ff32 ed44 	vabd.f16	q7, q1, q2
[^>]*> ff32 ed48 	vabd.f16	q7, q1, q4
[^>]*> ff32 ed4e 	vabd.f16	q7, q1, q7
[^>]*> ff34 ed40 	vabd.f16	q7, q2, q0
[^>]*> ff34 ed42 	vabd.f16	q7, q2, q1
[^>]*> ff34 ed44 	vabd.f16	q7, q2, q2
[^>]*> ff34 ed48 	vabd.f16	q7, q2, q4
[^>]*> ff34 ed4e 	vabd.f16	q7, q2, q7
[^>]*> ff38 ed40 	vabd.f16	q7, q4, q0
[^>]*> ff38 ed42 	vabd.f16	q7, q4, q1
[^>]*> ff38 ed44 	vabd.f16	q7, q4, q2
[^>]*> ff38 ed48 	vabd.f16	q7, q4, q4
[^>]*> ff38 ed4e 	vabd.f16	q7, q4, q7
[^>]*> ff3e ed40 	vabd.f16	q7, q7, q0
[^>]*> ff3e ed42 	vabd.f16	q7, q7, q1
[^>]*> ff3e ed44 	vabd.f16	q7, q7, q2
[^>]*> ff3e ed48 	vabd.f16	q7, q7, q4
[^>]*> ff3e ed4e 	vabd.f16	q7, q7, q7
[^>]*> ff20 0d40 	vabd.f32	q0, q0, q0
[^>]*> ff20 0d42 	vabd.f32	q0, q0, q1
[^>]*> ff20 0d44 	vabd.f32	q0, q0, q2
[^>]*> ff20 0d48 	vabd.f32	q0, q0, q4
[^>]*> ff20 0d4e 	vabd.f32	q0, q0, q7
[^>]*> ff22 0d40 	vabd.f32	q0, q1, q0
[^>]*> ff22 0d42 	vabd.f32	q0, q1, q1
[^>]*> ff22 0d44 	vabd.f32	q0, q1, q2
[^>]*> ff22 0d48 	vabd.f32	q0, q1, q4
[^>]*> ff22 0d4e 	vabd.f32	q0, q1, q7
[^>]*> ff24 0d40 	vabd.f32	q0, q2, q0
[^>]*> ff24 0d42 	vabd.f32	q0, q2, q1
[^>]*> ff24 0d44 	vabd.f32	q0, q2, q2
[^>]*> ff24 0d48 	vabd.f32	q0, q2, q4
[^>]*> ff24 0d4e 	vabd.f32	q0, q2, q7
[^>]*> ff28 0d40 	vabd.f32	q0, q4, q0
[^>]*> ff28 0d42 	vabd.f32	q0, q4, q1
[^>]*> ff28 0d44 	vabd.f32	q0, q4, q2
[^>]*> ff28 0d48 	vabd.f32	q0, q4, q4
[^>]*> ff28 0d4e 	vabd.f32	q0, q4, q7
[^>]*> ff2e 0d40 	vabd.f32	q0, q7, q0
[^>]*> ff2e 0d42 	vabd.f32	q0, q7, q1
[^>]*> ff2e 0d44 	vabd.f32	q0, q7, q2
[^>]*> ff2e 0d48 	vabd.f32	q0, q7, q4
[^>]*> ff2e 0d4e 	vabd.f32	q0, q7, q7
[^>]*> ff20 2d40 	vabd.f32	q1, q0, q0
[^>]*> ff20 2d42 	vabd.f32	q1, q0, q1
[^>]*> ff20 2d44 	vabd.f32	q1, q0, q2
[^>]*> ff20 2d48 	vabd.f32	q1, q0, q4
[^>]*> ff20 2d4e 	vabd.f32	q1, q0, q7
[^>]*> ff22 2d40 	vabd.f32	q1, q1, q0
[^>]*> ff22 2d42 	vabd.f32	q1, q1, q1
[^>]*> ff22 2d44 	vabd.f32	q1, q1, q2
[^>]*> ff22 2d48 	vabd.f32	q1, q1, q4
[^>]*> ff22 2d4e 	vabd.f32	q1, q1, q7
[^>]*> ff24 2d40 	vabd.f32	q1, q2, q0
[^>]*> ff24 2d42 	vabd.f32	q1, q2, q1
[^>]*> ff24 2d44 	vabd.f32	q1, q2, q2
[^>]*> ff24 2d48 	vabd.f32	q1, q2, q4
[^>]*> ff24 2d4e 	vabd.f32	q1, q2, q7
[^>]*> ff28 2d40 	vabd.f32	q1, q4, q0
[^>]*> ff28 2d42 	vabd.f32	q1, q4, q1
[^>]*> ff28 2d44 	vabd.f32	q1, q4, q2
[^>]*> ff28 2d48 	vabd.f32	q1, q4, q4
[^>]*> ff28 2d4e 	vabd.f32	q1, q4, q7
[^>]*> ff2e 2d40 	vabd.f32	q1, q7, q0
[^>]*> ff2e 2d42 	vabd.f32	q1, q7, q1
[^>]*> ff2e 2d44 	vabd.f32	q1, q7, q2
[^>]*> ff2e 2d48 	vabd.f32	q1, q7, q4
[^>]*> ff2e 2d4e 	vabd.f32	q1, q7, q7
[^>]*> ff20 4d40 	vabd.f32	q2, q0, q0
[^>]*> ff20 4d42 	vabd.f32	q2, q0, q1
[^>]*> ff20 4d44 	vabd.f32	q2, q0, q2
[^>]*> ff20 4d48 	vabd.f32	q2, q0, q4
[^>]*> ff20 4d4e 	vabd.f32	q2, q0, q7
[^>]*> ff22 4d40 	vabd.f32	q2, q1, q0
[^>]*> ff22 4d42 	vabd.f32	q2, q1, q1
[^>]*> ff22 4d44 	vabd.f32	q2, q1, q2
[^>]*> ff22 4d48 	vabd.f32	q2, q1, q4
[^>]*> ff22 4d4e 	vabd.f32	q2, q1, q7
[^>]*> ff24 4d40 	vabd.f32	q2, q2, q0
[^>]*> ff24 4d42 	vabd.f32	q2, q2, q1
[^>]*> ff24 4d44 	vabd.f32	q2, q2, q2
[^>]*> ff24 4d48 	vabd.f32	q2, q2, q4
[^>]*> ff24 4d4e 	vabd.f32	q2, q2, q7
[^>]*> ff28 4d40 	vabd.f32	q2, q4, q0
[^>]*> ff28 4d42 	vabd.f32	q2, q4, q1
[^>]*> ff28 4d44 	vabd.f32	q2, q4, q2
[^>]*> ff28 4d48 	vabd.f32	q2, q4, q4
[^>]*> ff28 4d4e 	vabd.f32	q2, q4, q7
[^>]*> ff2e 4d40 	vabd.f32	q2, q7, q0
[^>]*> ff2e 4d42 	vabd.f32	q2, q7, q1
[^>]*> ff2e 4d44 	vabd.f32	q2, q7, q2
[^>]*> ff2e 4d48 	vabd.f32	q2, q7, q4
[^>]*> ff2e 4d4e 	vabd.f32	q2, q7, q7
[^>]*> ff20 8d40 	vabd.f32	q4, q0, q0
[^>]*> ff20 8d42 	vabd.f32	q4, q0, q1
[^>]*> ff20 8d44 	vabd.f32	q4, q0, q2
[^>]*> ff20 8d48 	vabd.f32	q4, q0, q4
[^>]*> ff20 8d4e 	vabd.f32	q4, q0, q7
[^>]*> ff22 8d40 	vabd.f32	q4, q1, q0
[^>]*> ff22 8d42 	vabd.f32	q4, q1, q1
[^>]*> ff22 8d44 	vabd.f32	q4, q1, q2
[^>]*> ff22 8d48 	vabd.f32	q4, q1, q4
[^>]*> ff22 8d4e 	vabd.f32	q4, q1, q7
[^>]*> ff24 8d40 	vabd.f32	q4, q2, q0
[^>]*> ff24 8d42 	vabd.f32	q4, q2, q1
[^>]*> ff24 8d44 	vabd.f32	q4, q2, q2
[^>]*> ff24 8d48 	vabd.f32	q4, q2, q4
[^>]*> ff24 8d4e 	vabd.f32	q4, q2, q7
[^>]*> ff28 8d40 	vabd.f32	q4, q4, q0
[^>]*> ff28 8d42 	vabd.f32	q4, q4, q1
[^>]*> ff28 8d44 	vabd.f32	q4, q4, q2
[^>]*> ff28 8d48 	vabd.f32	q4, q4, q4
[^>]*> ff28 8d4e 	vabd.f32	q4, q4, q7
[^>]*> ff2e 8d40 	vabd.f32	q4, q7, q0
[^>]*> ff2e 8d42 	vabd.f32	q4, q7, q1
[^>]*> ff2e 8d44 	vabd.f32	q4, q7, q2
[^>]*> ff2e 8d48 	vabd.f32	q4, q7, q4
[^>]*> ff2e 8d4e 	vabd.f32	q4, q7, q7
[^>]*> ff20 ed40 	vabd.f32	q7, q0, q0
[^>]*> ff20 ed42 	vabd.f32	q7, q0, q1
[^>]*> ff20 ed44 	vabd.f32	q7, q0, q2
[^>]*> ff20 ed48 	vabd.f32	q7, q0, q4
[^>]*> ff20 ed4e 	vabd.f32	q7, q0, q7
[^>]*> ff22 ed40 	vabd.f32	q7, q1, q0
[^>]*> ff22 ed42 	vabd.f32	q7, q1, q1
[^>]*> ff22 ed44 	vabd.f32	q7, q1, q2
[^>]*> ff22 ed48 	vabd.f32	q7, q1, q4
[^>]*> ff22 ed4e 	vabd.f32	q7, q1, q7
[^>]*> ff24 ed40 	vabd.f32	q7, q2, q0
[^>]*> ff24 ed42 	vabd.f32	q7, q2, q1
[^>]*> ff24 ed44 	vabd.f32	q7, q2, q2
[^>]*> ff24 ed48 	vabd.f32	q7, q2, q4
[^>]*> ff24 ed4e 	vabd.f32	q7, q2, q7
[^>]*> ff28 ed40 	vabd.f32	q7, q4, q0
[^>]*> ff28 ed42 	vabd.f32	q7, q4, q1
[^>]*> ff28 ed44 	vabd.f32	q7, q4, q2
[^>]*> ff28 ed48 	vabd.f32	q7, q4, q4
[^>]*> ff28 ed4e 	vabd.f32	q7, q4, q7
[^>]*> ff2e ed40 	vabd.f32	q7, q7, q0
[^>]*> ff2e ed42 	vabd.f32	q7, q7, q1
[^>]*> ff2e ed44 	vabd.f32	q7, q7, q2
[^>]*> ff2e ed48 	vabd.f32	q7, q7, q4
[^>]*> ff2e ed4e 	vabd.f32	q7, q7, q7
[^>]*> ff2a 8d4c 	vabd.f32	q4, q5, q6
[^>]*> fe71 af4d 	vpstett
[^>]*> ef02 0744 	vabdt.s8	q0, q1, q2
[^>]*> ff04 2740 	vabde.u8	q1, q2, q0
[^>]*> ef1e 4748 	vabdt.s16	q2, q7, q4
[^>]*> ff38 cd4a 	vabdt.f16	q6, q4, q5
[^>]*> fe71 ef4d 	vpstete
[^>]*> ff18 474a 	vabdt.u16	q2, q4, q5
[^>]*> ef2a 874c 	vabde.s32	q4, q5, q6
[^>]*> ff2c a74e 	vabdt.u32	q5, q6, q7
[^>]*> ff2a 8d4c 	vabde.f32	q4, q5, q6
