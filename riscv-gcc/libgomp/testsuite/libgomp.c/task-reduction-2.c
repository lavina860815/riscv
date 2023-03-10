typedef __SIZE_TYPE__ size_t;
extern void abort (void);

void
bar (int *a, int *b, int *c, int (*d)[2], int (*e)[4], size_t n, int f[1][n], int g[1][n * 2])
{
  #pragma omp task in_reduction (*: a[:n], b[3:n], c[n:n], d[0][:n], e[0][1:n], f[0][:], g[0][1:n])
  {
    a[0] *= 12;
    a[1] *= 13;
    b[3] *= 14;
    b[4] *= 15;
    c[n] *= 16;
    c[n + 1] *= 17;
    d[0][0] *= 18;
    d[0][1] *= 19;
    e[0][1] *= 20;
    e[0][2] *= 21;
    f[0][0] *= 22;
    f[0][1] *= 23;
    g[0][1] *= 24;
    g[0][2] *= 25;
  }
}

void
baz (size_t n, void *x, void *y, int f[1][n], int g[1][n * 2])
{
  int a[n], b[n + 3], c[2 * n];
  int (*d)[n] = (int (*)[n]) x;
  int (*e)[n * 2] = (int (*)[n * 2]) y;
  int i;
  for (i = 0; i < n; i++)
    {
      a[i] = 1;
      b[i + 3] = 1;
      c[i + n] = 1;
      d[0][i] = 1;
      e[0][i + 1] = 1;
      f[0][i] = 1;
      g[0][i + 1] = 1;
    }
  #pragma omp parallel num_threads(2) firstprivate (n) \
		       reduction (task, *: a, b[3:n], c[n:n], d[0][:n], e[0][1:n], f[0][:], g[0][1:n])
  {
    #pragma omp master
    bar (a, b, c, (int (*)[2]) d, (int (*)[4]) e, n, f, g);
    #pragma omp master
    #pragma omp task in_reduction (*: a, b[3:n], c[n:n], d[0][:n], e[0][1:n], f[0][:], g[0][1:n])
    {
      a[0] *= 2;
      a[1] *= 3;
      b[3] *= 4;
      b[4] *= 5;
      c[n] *= 6;
      c[n + 1] *= 7;
      d[0][0] *= 8;
      d[0][1] *= 9;
      e[0][1] *= 10;
      e[0][2] *= 11;
      f[0][0] *= 12;
      f[0][1] *= 13;
      g[0][1] *= 14;
      g[0][2] *= 15;
    }
    n = 0;
  }
  if (a[0] != 24 || a[1] != 39 || b[3] != 56 || b[4] != 75)
    abort ();
  if (c[2] != 96 || c[3] != 119 || d[0][0] != 144 || d[0][1] != 171)
    abort ();
  if (e[0][1] != 200 || e[0][2] != 231 || f[0][0] != 264 || f[0][1] != 299)
    abort ();
  if (g[0][1] != 336 || g[0][2] != 375)
    abort ();
}

int
main ()
{
  int d[1][2], e[1][4], f[1][2], g[1][4];
  volatile int two;
  two = 2;
  baz (two, (void *) d, (void *) e, f, g);
  return 0;
}
