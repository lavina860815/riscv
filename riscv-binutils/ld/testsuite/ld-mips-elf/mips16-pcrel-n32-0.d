#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS16 link PC-relative operations 0 (n32)
#source: ../../../gas/testsuite/gas/mips/mips16-pcrel-0.s
#ld: -Ttext 0 -e 0
#dump: mips16-pcrel-0.d
