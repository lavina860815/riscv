/* { dg-do compile } */
/* { dg-options "-O2 -fopenmp -fdump-tree-optimized" } */
/* { dg-final { scan-tree-dump-times "__builtin_GOMP_loop_start \[^\n\r]*, 2, 1, " 1 "optimized" } } */
/* { dg-final { scan-tree-dump-times "__builtin_GOMP_loop_end " 1 "optimized" } } */
/* { dg-final { scan-tree-dump-times "__builtin_GOMP_loop_nonmonotonic_dynamic_next " 1 "optimized" } } */
/* { dg-final { scan-tree-dump-times "__builtin_GOMP_workshare_task_reduction_unregister \\(0\\)" 1 "optimized" } } */
/* { dg-final { scan-tree-dump-times "__builtin_GOMP_parallel " 1 "optimized" } } */

int j;
void bar (int *);

void
foo (int a, int b, int c)
{
  int i;
  #pragma omp parallel
  #pragma omp for reduction (task, *: j) schedule (nonmonotonic: dynamic)
  for (i = a; i < b; i += c)
    {
      j++;
      bar (&j);
    }
}
