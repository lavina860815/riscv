#source: ibt-plt-3.s
#as: --x32
#ld: -shared -m elf32_x86_64 -z ibt --hash-style=sysv -z max-page-size=0x200000 -z noseparate-code
#readelf: -wf -n

Contents of the .eh_frame section:

0+ 00000014 00000000 CIE
  Version:               1
  Augmentation:          "zR"
  Code alignment factor: 1
  Data alignment factor: -8
  Return address column: 16
  Augmentation data:     1b

  DW_CFA_def_cfa: r7 \(rsp\) ofs 8
  DW_CFA_offset: r16 \(rip\) at cfa-8
  DW_CFA_nop
  DW_CFA_nop

0+18 00000014 0000001c FDE cie=00000000 pc=[a-f0-9]+\.\.[a-f0-9]+
  DW_CFA_advance_loc: 4 to [a-f0-9]+
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 9 to [a-f0-9]+
  DW_CFA_def_cfa_offset: 8
  DW_CFA_nop

0+30 00000020 00000034 FDE cie=00000000 pc=[a-f0-9]+\.\.[a-f0-9]+
  DW_CFA_def_cfa_offset: 16
  DW_CFA_advance_loc: 6 to [a-f0-9]+
  DW_CFA_def_cfa_offset: 24
  DW_CFA_advance_loc: 10 to [a-f0-9]+
  DW_CFA_def_cfa_expression \(DW_OP_breg7 \(rsp\): 8; DW_OP_breg16 \(rip\): 0; DW_OP_lit15; DW_OP_and; DW_OP_lit9; DW_OP_ge; DW_OP_lit3; DW_OP_shl; DW_OP_plus\)

0+54 00000010 00000058 FDE cie=00000000 pc=[a-f0-9]+\.\.[a-f0-9]+
  DW_CFA_nop
  DW_CFA_nop
  DW_CFA_nop


Displaying notes found in: .note.gnu.property
[ 	]+Owner[ 	]+Data size[ 	]+Description
  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT

