/* { dg-require-effective-target vect_int } */

#define SIGNEDNESS_1 unsigned
#define SIGNEDNESS_2 signed
#define SIGNEDNESS_3 unsigned

#include "vect-reduc-sad-1.c"

/* { dg-final { scan-tree-dump "vect_recog_sad_pattern: detected" "vect" } } */

