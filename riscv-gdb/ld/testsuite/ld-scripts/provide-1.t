SECTIONS 
{
  .data 0x2000 :
  {
    LONG (foo)
    LONG (bar)
    . = ALIGN (0x10);
    *(.data .rw)
  }
  PROVIDE (foo = .);
  PROVIDE (bar = .);
}
