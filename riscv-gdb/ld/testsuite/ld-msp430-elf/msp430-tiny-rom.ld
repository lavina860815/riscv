/* Script for ld testsuite */
OUTPUT_ARCH(msp430)
ENTRY(_start)

MEMORY
{
  ROM : ORIGIN = 0x0, LENGTH = 0x2
  RAM : ORIGIN = 0x2, LENGTH = 0x1fe
  HIROM : ORIGIN = 0x200, LENGTH = 0x1000
}

SECTIONS
{
  .text :
  {
    PROVIDE (_start = .);
    . = ALIGN(2);
    *(.text .stub .text.* .gnu.linkonce.t.* .text:*)
  } > ROM

  .rodata :
  {
    *(.rodata.* .rodata)
  } > ROM

  .data :
  {
    . = ALIGN(2);
    *(.data.* .data)
  } > RAM AT> ROM

  .bss :
  {
    . = ALIGN(2);
    *(.bss.* .bss)
  } > RAM

  .upper.text :
  {
    . = ALIGN(2);
    *(.upper.text.* .upper.text)
  } > HIROM

  .upper.rodata :
  {
    *(.upper.rodata.* .upper.rodata)
  } > HIROM
}
