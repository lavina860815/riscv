; Test mismatch of --march=ARCH1 and .arch ARCH2.
; { dg-do assemble }
; { dg-options "--march=v10" }
 .arch common_v10_v32 ; { dg-error ".arch <arch> requires a matching --march=" }

