/* Verify that we refuse 'acc_free', after 'acc_map_data'.  */

/* { dg-skip-if "" { *-*-* } { "*" } { "-DACC_MEM_SHARED=0" } } */

#include <stdio.h>
#include <stdlib.h>
#include <openacc.h>

int
main ()
{
  const int N = 108;

  char *h = (char *) malloc (N);
  void *d = acc_malloc (N - 10);
  if (!d)
    abort ();
  acc_map_data (h, d, N - 19);

  fprintf (stderr, "CheCKpOInT\n");
  acc_free (d);

  return 0;
}

/* { dg-output "CheCKpOInT(\n|\r\n|\r).*" }
   { dg-output "refusing to free device memory space at \[0-9a-fA-FxX\]+ that is still mapped at \\\[\[0-9a-fA-FxX\]+,\\\+89\\\]" }
   { dg-shouldfail "" } */
