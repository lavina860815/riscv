-- { dg-do run }

with Init6; use Init6;
with Text_IO; use Text_IO;
with Dump;

procedure U6 is

  Local_R1 : R1;
  Local_R2 : R2;
  C1 : Integer;
  C2 : Integer;

begin
  Local_R1 := (I => 1, A => (16#AB0012#, 16#CD0034#, 16#EF0056#));
  Put ("Local_R1 :");
  Dump (Local_R1'Address, R1'Max_Size_In_Storage_Elements);
  New_Line;
  -- { dg-output "Local_R1 : 01 00 00 00 00 ab 00 12 00 cd 00 34 00 ef 00 56.*\n" }

  Local_R2 := (I => 1, A => (16#AB0012#, 16#CD0034#, 16#EF0056#));
  Put ("Local_R2 :");
  Dump (Local_R2'Address, R2'Max_Size_In_Storage_Elements);
  New_Line;
  -- { dg-output "Local_R2 : 00 00 00 01 12 00 ab 00 34 00 cd 00 56 00 ef 00.*\n" }

  C1 := Local_R1.A (Local_R1.I);
  Put_Line ("C1 :" & C1'Img);
  -- { dg-output "C1 : 11206674.*\n" }

  Local_R1.I := Local_R1.I + 1;  
  C1 := Local_R1.A (Local_R1.I);
  Put_Line ("C1 :" & C1'Img);
  -- { dg-output "C1 : 13434932.*\n" }

  C2 := Local_R2.A (Local_R2.I);
  Put_Line ("C2 :" & C2'Img);
  -- { dg-output "C2 : 11206674.*\n" }

  Local_R2.I := Local_R2.I + 1;  
  C2 := Local_R2.A (Local_R2.I);
  Put_Line ("C2 :" & C2'Img);
  -- { dg-output "C2 : 13434932.*\n" }
end;
