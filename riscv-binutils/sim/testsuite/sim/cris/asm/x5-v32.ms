#mach: crisv32
#ld: --section-start=.text=0
#sim: --cris-trace=basic
#output: 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 * ixnzvc 0 0\n
#output: 8 0 0 0 0 0 14 0 0 0 0 0 0 0 0 * ixnzvc 1 0\n
#output: a 0 0 0 0 1 14 0 0 0 0 0 0 0 0 * ixnzvc 1 0\n
#output: c 0 0 0 1 1 18 0 0 0 0 0 0 0 0 * ixnzvc 1 0\n
#output: e 0 0 2 1 1 18 0 0 0 0 0 0 0 0 * ixnzvc 1 0\n
 .include "tmemv10.ms"
