#!/usr/bin/env python

# Capstone Python bindings, by Nguyen Anh Quynnh <aquynh@gmail.com>

from __future__ import print_function
from capstone import *
from xprint import to_hex

CODE = "\x60\x61\x50"
cs = Cs(CS_ARCH_EVM, 0)
cs.detail = True

print("Platform: EVM")
print("Code: %s" %to_hex(CODE))
print("Disasm:")

for i in cs.disasm(CODE, 0x80001000):
    print("0x%x:\t%s\t%s" %(i.address, i.mnemonic, i.op_str))
    if i.pop > 0:
        print("\tPop:     %u" %i.pop)
    if i.push > 0:
        print("\tPush:    %u" %i.push)
    if i.fee > 0:
        print("\tGas fee: %u" %i.fee)
    if len(i.groups) > 0:
        print("\tGroups: ", end=''),
        for m in i.groups:
            print("%s " % i.group_name(m), end=''),
        print()
