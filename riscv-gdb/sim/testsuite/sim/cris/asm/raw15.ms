; Checking read-after-write: cycles included in "all".
#mach: crisv32
#output: All accounted clock cycles, total @: 6\n
#output: Memory source stall cycles: 0\n
#output: Memory read-after-write stall cycles: 2\n
#output: Movem source stall cycles: 0\n
#output: Movem destination stall cycles: 0\n
#output: Movem address stall cycles: 0\n
#output: Multiplication source stall cycles: 0\n
#output: Jump source stall cycles: 0\n
#output: Branch misprediction stall cycles: 0\n
#output: Jump target stall cycles: 0\n
#sim: --cris-cycles=all
 .include "raw4.ms"
