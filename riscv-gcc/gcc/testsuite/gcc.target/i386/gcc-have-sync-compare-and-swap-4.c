/* { dg-do preprocess { target { ! ia32 } } } */
/* { dg-options "-mcx16" } */

#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1
#error nonono
#endif

#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2
#error nonono
#endif

#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
#error nonono
#endif

#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
#error nonono
#endif

#ifndef __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
#error nonono
#endif
