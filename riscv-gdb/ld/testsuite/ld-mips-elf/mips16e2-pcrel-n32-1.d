#objdump: -dr --prefix-addresses --show-raw-insn
#name: MIPS16e2 link PC-relative operations 1 (n32)
#source: ../../../gas/testsuite/gas/mips/mips16-pcrel-1.s
#as: -mips64r2 -mmips16e2
#ld: -Ttext 0 -e 0
#dump: mips16e2-pcrel-1.d
