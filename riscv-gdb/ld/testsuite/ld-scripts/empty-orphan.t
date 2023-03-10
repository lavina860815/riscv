MEMORY
{
  default_mem : ORIGIN = 0x0, LENGTH = 0x100000
  text_mem : ORIGIN = 0x60000000, LENGTH = 0x100
  data_mem : ORIGIN = 0x70000000, LENGTH = 0x100
}

PHDRS
{
  headers PT_PHDR PHDRS;
  text_phdr PT_LOAD PHDRS;
  data_phdr PT_LOAD;
}

SECTIONS
{
   .text : { *(.text) } > text_mem : text_phdr :headers
   .data : { *(.data) } > data_mem : data_phdr
   .bss : { *(.bss) } > data_mem : data_phdr
   /DISCARD/ : { *(.reginfo) *(.glue*) }
   /* .orphan_data is an orphan */
}
