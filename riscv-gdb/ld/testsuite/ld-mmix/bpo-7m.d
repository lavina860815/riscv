#source: start.s
#source: bpo-4.s
#source: greg-1.s
#as: -linker-allocated-gregs
#ld: -m mmo
#error: too many global registers: 224
