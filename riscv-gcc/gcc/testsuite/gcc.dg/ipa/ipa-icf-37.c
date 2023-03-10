/* { dg-do compile } */
/* { dg-options "-O2 -fdump-ipa-icf-optimized"  } */

static int a;
static int b;
static const int c = 2;
static const int d = 2;
static char * e = "test";
static char * f = "test";
static int g[3]={1,2,3};
static int h[3]={1,2,3};
static const int *i=&c;
static const int *j=&c;
static const int *k=&d;
int t(int tt)
{
  switch (tt)
  {
    case 1: return a;
    case 2: return b;
    case 3: return c;
    case 4: return d;
    case 5: return e[1];
    case 6: return f[1];
    case 7: return g[1];
    case 8: return h[1];
    case 9: return i[0];
    case 10: return j[0];
    case 11: return k[0];
  }
}

/* { dg-final { scan-ipa-dump "Equal symbols: 5" "icf"  } } */
/* { dg-final { scan-ipa-dump "Semantic equality hit:a/\[0-9+\]+->b/\[0-9+\]+" "icf"  } } */
/* { dg-final { scan-ipa-dump "Semantic equality hit:c/\[0-9+\]+->d/\[0-9+\]+" "icf"  } } */
/* { dg-final { scan-ipa-dump "Semantic equality hit:e/\[0-9+\]+->f/\[0-9+\]+" "icf"  } } */
/* { dg-final { scan-ipa-dump "Semantic equality hit:g/\[0-9+\]+->h/\[0-9+\]+" "icf"  } } */
/* { dg-final { scan-ipa-dump "Semantic equality hit:i/\[0-9+\]+->j/\[0-9+\]+" "icf"  } } */
