
.*dw2-1-compressed.o:     file format .*

Contents of the .z?debug_info section:

  Compilation Unit @ offset 0x0:
   Length:        0x4e \(32-bit\)
   Version:       2
   Abbrev Offset: 0x0
   Pointer Size:  4
 <0><b>: Abbrev Number: 1 \(DW_TAG_compile_unit\)
    <c>   DW_AT_stmt_list   : 0x0
    <10>   DW_AT_high_pc     : 0x.
    <14>   DW_AT_low_pc      : 0x.
    <18>   DW_AT_name        : file1.txt
    <22>   DW_AT_producer    : GNU C 3.3.3
    <2e>   DW_AT_language    : 1	\(ANSI C\)
 <1><2f>: Abbrev Number: 2 \(DW_TAG_subprogram\)
    <30>   DW_AT_external    : 1
    <31>   DW_AT_decl_file   : 1
    <32>   DW_AT_decl_line   : 2
    <33>   DW_AT_name        : func_cu1
    <3c>   DW_AT_type        : <0x4a>
    <40>   DW_AT_low_pc      : 0x.
    <44>   DW_AT_high_pc     : 0x.
    <48>   DW_AT_frame_base  : 1 byte block: 55 	\(DW_OP_reg5 \([^()]*\)\)
 <1><4a>: Abbrev Number: 3 \(DW_TAG_base_type\)
    <4b>   DW_AT_name        : int
    <4f>   DW_AT_byte_size   : 4
    <50>   DW_AT_encoding    : 5	\(signed\)
 <1><51>: Abbrev Number: 0

Raw dump of debug contents of section .z?debug_line:

  Offset:                      0x0
  Length:                      62
  DWARF Version:               2
  Prologue Length:             35
  Minimum Instruction Length:  1
  Initial value of 'is_stmt':  1
  Line Base:                   1
  Line Range:                  1
  Opcode Base:                 16

 Opcodes:
  Opcode 1 has 0 args
  Opcode 2 has 1 arg
  Opcode 3 has 1 arg
  Opcode 4 has 1 arg
  Opcode 5 has 1 arg
  Opcode 6 has 0 args
  Opcode 7 has 0 args
  Opcode 8 has 0 args
  Opcode 9 has 1 arg
  Opcode 10 has 0 args
  Opcode 11 has 0 args
  Opcode 12 has 1 arg
  Opcode 13 has 0 args
  Opcode 14 has 0 args
  Opcode 15 has 0 args

 The Directory Table is empty.

 The File Name Table \(offset 0x.*\):
  Entry	Dir	Time	Size	Name
  1	0	0	0	file1.txt

 Line Number Statements:
  \[0x.*\]  Extended opcode 2: set Address to 0x4
  \[0x.*\]  Advance Line by 3 to 4
  \[0x.*\]  Copy
  \[0x.*\]  Copy \(view 1\)
  \[0x.*\]  Extended opcode 2: set Address to 0x8
  \[0x.*\]  Extended opcode 1: End of Sequence


Contents of the .debug_abbrev section:

  Number TAG \(0x0\)
   1      DW_TAG_compile_unit    \[has children\]
    DW_AT_stmt_list    DW_FORM_data4
    DW_AT_high_pc      DW_FORM_addr
    DW_AT_low_pc       DW_FORM_addr
    DW_AT_name         DW_FORM_string
    DW_AT_producer     DW_FORM_string
    DW_AT_language     DW_FORM_data1
    DW_AT value: 0     DW_FORM value: 0
   2      DW_TAG_subprogram    \[no children\]
    DW_AT_external     DW_FORM_flag
    DW_AT_decl_file    DW_FORM_data1
    DW_AT_decl_line    DW_FORM_data1
    DW_AT_name         DW_FORM_string
    DW_AT_type         DW_FORM_ref4
    DW_AT_low_pc       DW_FORM_addr
    DW_AT_high_pc      DW_FORM_addr
    DW_AT_frame_base   DW_FORM_block1
    DW_AT value: 0     DW_FORM value: 0
   3      DW_TAG_base_type    \[no children\]
    DW_AT_name         DW_FORM_string
    DW_AT_byte_size    DW_FORM_data1
    DW_AT_encoding     DW_FORM_data1
    DW_AT value: 0     DW_FORM value: 0

