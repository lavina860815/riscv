#objdump: -dr --prefix-addresses --show-raw-insn
#name:
#as: -march=c64x+ -mlittle-endian

.*: *file format elf32-tic6x-le


Disassembly of section .text:
[ \t]*\.\.\.
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stw \.D1T1 a0,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stw \.D1T2 b0,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+stb \.D1T1 a0,\*--a4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+ldw \.D1T1 \*--a4\(4\),a0
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stw \.D2T1 a0,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b0,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a0,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+ldw \.D2T1 \*--b4\(4\),a0
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b0,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stw \.D2T1 a0,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldbu \.D2T2 \*--b4\(1\),b0
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldbu \.D2T1 \*--b4\(2\),a0
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldbu \.D2T2 \*--b4\(2\),b1
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldbu \.D2T1 \*--b4\(2\),a1
[0-9a-f]+[02468ace] <[^>]*> efe00000[ \t]+<fetch packet header 0xefe00000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stw \.D1T1 a16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stw \.D1T2 b16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+stb \.D1T1 a16,\*--a4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+ldw \.D1T1 \*--a4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a16,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+ldw \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a16,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldbu \.D2T2 \*--b4\(1\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldbu \.D2T1 \*--b4\(2\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldbu \.D2T2 \*--b4\(2\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldbu \.D2T1 \*--b4\(2\),a17
[0-9a-f]+[02468ace] <[^>]*> efe8c000[ \t]+<fetch packet header 0xefe8c000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stw \.D1T1 a16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stw \.D1T2 b16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+stb \.D1T1 a16,\*--a4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+ldw \.D1T1 \*--a4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a16,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+ldw \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a16,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldb \.D2T2 \*--b4\(1\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldb \.D2T1 \*--b4\(2\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldb \.D2T2 \*--b4\(2\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldb \.D2T1 \*--b4\(2\),a17
[0-9a-f]+[02468ace] <[^>]*> efe9c000[ \t]+<fetch packet header 0xefe9c000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stw \.D1T1 a16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stw \.D1T2 b16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+sth \.D1T1 a16,\*--a4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+ldw \.D1T1 \*--a4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+sth \.D2T1 a16,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+ldw \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+sth \.D2T1 a16,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldhu \.D2T2 \*--b4\(2\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldhu \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldhu \.D2T2 \*--b4\(4\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldhu \.D2T1 \*--b4\(4\),a17
[0-9a-f]+[02468ace] <[^>]*> efeac000[ \t]+<fetch packet header 0xefeac000>
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+sth \.D1T1 a16,\*--a4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 5e04[ \t]+sth \.D1T2 b16,\*--a4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+sth \.D1T1 a16,\*--a4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+ldw \.D1T1 \*--a4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+sth \.D2T1 a16,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+ldw \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stw \.D2T2 b16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+sth \.D2T1 a16,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldh \.D2T2 \*--b4\(2\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldh \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldh \.D2T2 \*--b4\(4\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldh \.D2T1 \*--b4\(4\),a17
[0-9a-f]+[02468ace] <[^>]*> efebc000[ \t]+<fetch packet header 0xefebc000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stdw \.D1T1 a17:a16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stdw \.D1T2 b17:b16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+stw \.D1T1 a16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+lddw \.D1T1 \*--a4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stdw \.D2T1 a17:a16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+lddw \.D2T1 \*--b4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldw \.D2T2 \*--b4\(4\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldw \.D2T1 \*--b4\(8\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldw \.D2T2 \*--b4\(8\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldw \.D2T1 \*--b4\(8\),a17
[0-9a-f]+[02468ace] <[^>]*> efecc000[ \t]+<fetch packet header 0xefecc000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stdw \.D1T1 a17:a16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stdw \.D1T2 b17:b16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+stb \.D1T1 a16,\*--a4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+lddw \.D1T1 \*--a4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stdw \.D2T1 a17:a16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a16,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+lddw \.D2T1 \*--b4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stb \.D2T1 a16,\*--b4\(1\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldb \.D2T2 \*--b4\(1\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldb \.D2T1 \*--b4\(2\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldb \.D2T2 \*--b4\(2\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldb \.D2T1 \*--b4\(2\),a17
[0-9a-f]+[02468ace] <[^>]*> efedc000[ \t]+<fetch packet header 0xefedc000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stdw \.D1T1 a17:a16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stdw \.D1T2 b17:b16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+stnw \.D1T1 a16,\*--a4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+lddw \.D1T1 \*--a4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stdw \.D2T1 a17:a16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stnw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+lddw \.D2T1 \*--b4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+stnw \.D2T1 a16,\*--b4\(4\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldnw \.D2T2 \*--b4\(4\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldnw \.D2T1 \*--b4\(8\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldnw \.D2T2 \*--b4\(8\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldnw \.D2T1 \*--b4\(8\),a17
[0-9a-f]+[02468ace] <[^>]*> efeec000[ \t]+<fetch packet header 0xefeec000>
[0-9a-f]+[02468ace] <[^>]*> 4c04[ \t]+stdw \.D1T1 a17:a16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c04[ \t]+stdw \.D1T2 b17:b16,\*--a4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e04[ \t]+sth \.D1T1 a16,\*--a4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c0c[ \t]+lddw \.D1T1 \*--a4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 4c05[ \t]+stdw \.D2T1 a17:a16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+sth \.D2T1 a16,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c0d[ \t]+lddw \.D2T1 \*--b4\(8\),a17:a16
[0-9a-f]+[02468ace] <[^>]*> 5c05[ \t]+stdw \.D2T2 b17:b16,\*--b4\(8\)
[0-9a-f]+[02468ace] <[^>]*> 4e05[ \t]+sth \.D2T1 a16,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 5e0d[ \t]+ldh \.D2T2 \*--b4\(2\),b16
[0-9a-f]+[02468ace] <[^>]*> 6e0d[ \t]+ldh \.D2T1 \*--b4\(4\),a16
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldh \.D2T2 \*--b4\(4\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldh \.D2T1 \*--b4\(4\),a17
[0-9a-f]+[02468ace] <[^>]*> efefc000[ \t]+<fetch packet header 0xefefc000>
[0-9a-f]+[02468ace] <[^>]*> 4c14[ \t]+stndw \.D1T1 a17:a16,\*--a4\[1\]
[0-9a-f]+[02468ace] <[^>]*> 5c14[ \t]+stndw \.D1T2 b17:b16,\*--a4\[1\]
[0-9a-f]+[02468ace] <[^>]*> 4e14[ \t]+sth \.D1T1 a17,\*--a4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c1c[ \t]+ldndw \.D1T1 \*--a4\[1\],a17:a16
[0-9a-f]+[02468ace] <[^>]*> 4c15[ \t]+stndw \.D2T1 a17:a16,\*--b4\[1\]
[0-9a-f]+[02468ace] <[^>]*> 5c15[ \t]+stndw \.D2T2 b17:b16,\*--b4\[1\]
[0-9a-f]+[02468ace] <[^>]*> 4e15[ \t]+sth \.D2T1 a17,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 4c1d[ \t]+ldndw \.D2T1 \*--b4\[1\],a17:a16
[0-9a-f]+[02468ace] <[^>]*> 5c15[ \t]+stndw \.D2T2 b17:b16,\*--b4\[1\]
[0-9a-f]+[02468ace] <[^>]*> 4e15[ \t]+sth \.D2T1 a17,\*--b4\(2\)
[0-9a-f]+[02468ace] <[^>]*> 5e1d[ \t]+ldh \.D2T2 \*--b4\(2\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldh \.D2T1 \*--b4\(4\),a17
[0-9a-f]+[02468ace] <[^>]*> 7e1d[ \t]+ldh \.D2T2 \*--b4\(4\),b17
[0-9a-f]+[02468ace] <[^>]*> 6e1d[ \t]+ldh \.D2T1 \*--b4\(4\),a17
[0-9a-f]+[02468ace] <[^>]*> efefc000[ \t]+<fetch packet header 0xefefc000>
[ \t]*\.\.\.
