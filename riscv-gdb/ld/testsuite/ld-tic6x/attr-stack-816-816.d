#name: C6X stack attribute merging, 816 816
#as: -mlittle-endian
#ld: -r -melf32_tic6x_le
#source: attr-stack-816.s
#source: attr-stack-816.s
#readelf: -A

Attribute Section: c6xabi
File Attributes
  Tag_ISA: C674x
  Tag_ABI_stack_align_preserved: 16-byte
