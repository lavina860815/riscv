#name: C6X SB-relative relocations, local symbols, REL
#as: -mlittle-endian -mgenerate-rel
#ld: -melf32_tic6x_le -Tsbr.ld
#source: sbr-reloc-local-1-rel.s
#source: sbr-reloc-local-2-rel.s
#objdump: -dr

.*: *file format elf32-tic6x-le


Disassembly of section \.text:

10000000 <[^>]*>:
10000000:[ \t]+0080006e[ \t]+ldw \.D2T2 \*\+b14\(0\),b1
10000004:[ \t]+0080016e[ \t]+ldw \.D2T2 \*\+b14\(4\),b1
10000008:[ \t]+0080024e[ \t]+ldh \.D2T2 \*\+b14\(4\),b1
1000000c:[ \t]+0080034e[ \t]+ldh \.D2T2 \*\+b14\(6\),b1
10000010:[ \t]+0080062e[ \t]+ldb \.D2T2 \*\+b14\(6\),b1
10000014:[ \t]+0080072e[ \t]+ldb \.D2T2 \*\+b14\(7\),b1
10000018:[ \t]+008003a8[ \t]+mvk \.S1 7,a1
1000001c:[ \t]+00800328[ \t]+mvk \.S1 6,a1
10000020:[ \t]+00800128[ \t]+mvk \.S1 2,a1
10000024:[ \t]+00800028[ \t]+mvk \.S1 0,a1
[ \t]*\.\.\.
10000040:[ \t]+0080026e[ \t]+ldw \.D2T2 \*\+b14\(8\),b1
10000044:[ \t]+0080036e[ \t]+ldw \.D2T2 \*\+b14\(12\),b1
10000048:[ \t]+0080064e[ \t]+ldh \.D2T2 \*\+b14\(12\),b1
1000004c:[ \t]+0080074e[ \t]+ldh \.D2T2 \*\+b14\(14\),b1
10000050:[ \t]+00800e2e[ \t]+ldb \.D2T2 \*\+b14\(14\),b1
10000054:[ \t]+00800f2e[ \t]+ldb \.D2T2 \*\+b14\(15\),b1
10000058:[ \t]+008007a8[ \t]+mvk \.S1 15,a1
1000005c:[ \t]+00800728[ \t]+mvk \.S1 14,a1
10000060:[ \t]+00800328[ \t]+mvk \.S1 6,a1
10000064:[ \t]+00800128[ \t]+mvk \.S1 2,a1
[ \t]*\.\.\.
