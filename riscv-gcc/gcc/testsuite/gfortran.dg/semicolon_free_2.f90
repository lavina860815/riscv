! { dg-do compile }
! { dg-options "-std=f2008" }
! PR 19259 Semicolon cannot start a line
x=1; y=1;
x=2;;
x=3;
 ; ! OK
;; ! OK
111 ; ! { dg-error "Semicolon at" }
end
