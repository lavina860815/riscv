// { dg-lto-do link }
// { dg-require-effective-target fpic }
// { dg-lto-options {{-flto -flto-partition=1to1 -fPIC}} }
// { dg-extra-ld-options "-flto -flto-partition=1to1 -r -nostdlib -flinker-output=nolto-rel" }

int X;
