/* Make sure the dwarf reg size table doesn't change for 64 bit.  */

/* { dg-do compile { target { lp64 } } } */

#define DWARF_FRAME_REGISTERS 34

static unsigned char dwarf_reg_size_table[DWARF_FRAME_REGISTERS + 1];
static unsigned char ref_reg_size_table[DWARF_FRAME_REGISTERS + 1] =
  { 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8,
    8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 4, 0 };

int
main ()
{
  __builtin_init_dwarf_reg_size_table (dwarf_reg_size_table);
  if (__builtin_memcmp (ref_reg_size_table,
			dwarf_reg_size_table, DWARF_FRAME_REGISTERS + 1) != 0)
    __builtin_abort ();
  return 0;
}
