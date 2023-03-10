/* { dg-do run } */

#include <stdio.h>

#include "init13.h"
#include "dump.h"

int main (void)
{
  struct R1 Local_R1;
  struct R2 Local_R2;

  Local_R1.F = My_R1.F + (1.0f + 1.0f * I);

  put ("Local_R1 :");
  dump (&Local_R1, sizeof (struct R1));
  new_line ();
  /* { dg-output "Local_R1 : ee 87 84 40 db 0f 09 c0.*\n" } */

  Local_R2.F = My_R2.F + (1.0f + 1.0f * I);

  put ("Local_R2 :");
  dump (&Local_R2, sizeof (struct R2));
  new_line ();
  /* { dg-output "Local_R2 : 40 84 87 ee c0 09 0f db.*\n" } */

  Local_R1.F = Pi - Pi * I;

  put ("Local_R1 :");
  dump (&Local_R1, sizeof (struct R1));
  new_line ();
  /* { dg-output "Local_R1 : db 0f 49 40 db 0f 49 c0.*\n" } */

  Local_R2.F = Pi - Pi * I;

  put ("Local_R2 :");
  dump (&Local_R2, sizeof (struct R2));
  new_line ();
  /* { dg-output "Local_R2 : 40 49 0f db c0 49 0f db.*\n" } */

  Local_R1.F = Local_R1.F + (1.0f + 1.0f * I);

  put ("Local_R1 :");
  dump (&Local_R1, sizeof (struct R1));
  new_line ();
  /* { dg-output "Local_R1 : ee 87 84 40 db 0f 09 c0.*\n" } */

  Local_R2.F = Local_R2.F + (1.0f + 1.0f * I);

  put ("Local_R2 :");
  dump (&Local_R2, sizeof (struct R2));
  new_line ();
  /* { dg-output "Local_R2 : 40 84 87 ee c0 09 0f db.*\n" } */

  new_line ();
  return 0;
}
