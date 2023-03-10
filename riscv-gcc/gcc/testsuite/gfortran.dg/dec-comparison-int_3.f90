! { dg-do compile }
!
! Test case contributed by Mark Eggleston  <mark.eggleston@codethink.com>
!

include "dec-comparison-int_1.f90"

! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 10 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 13 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 14 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 15 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 16 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 17 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 18 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 19 }
! { dg-warning "Extension: Hollerith constant at" " " { target *-*-* } 20 }
! { dg-warning "HOLLERITH to INTEGER" " " { target *-*-* } 10 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 13 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 14 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 15 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 16 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 17 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 18 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 19 }
! { dg-error "Operands of comparison operator" " " { target *-*-* } 20 }

