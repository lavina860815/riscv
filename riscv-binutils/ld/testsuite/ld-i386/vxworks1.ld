SECTIONS
{
  . = 0x80000;
  .interp : { *(.interp) }
  .hash : { *(.hash) }
  .dynsym : { *(.dynsym) }
  .dynstr : { *(.dynstr) }

  . = ALIGN (0x400);
  .rel.dyn : { *(.rel.dyn) }
  .rel.plt : { *(.rel.plt) }

  . = ALIGN (0x400);
  .plt : { *(.plt) }

  . = ALIGN (0x400);
  .text : { *(.text) }

  . = ALIGN (0x1000);
  .dynamic : { *(.dynamic) }

  . = ALIGN (0x400);
  .got : { *(.got.plt) *(.got) }

  . = ALIGN (0x400);
  .data : { *(.data) }

  . = ALIGN (0x400);
  .bss : { *(.bss) *(.dynbss) }
}
