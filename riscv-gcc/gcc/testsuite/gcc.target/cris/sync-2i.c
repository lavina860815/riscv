/* Check that we get the expected alignment-checking code, op variant, int.  */
/* { dg-do compile } */
/* { dg-options "-O2 -Dop -Dtype=int" } */
/* { dg-additional-options "-mtrap-using-break8 -mtrap-unaligned-atomic" { target cris-*-elf } } */
/* { dg-additional-options "-mno-unaligned-atomic-may-use-library" { target cris*-*-linux* } } */
/* { dg-final { scan-assembler "\tbreak 8" } } */
/* { dg-final { scan-assembler "\tbtstq \\(2-1\\)," } } */
/* { dg-final { scan-assembler-not "\tand" } } */
/* { dg-final { scan-assembler-not "\t\[jb\]sr" } } */
#include "sync-1.c"
