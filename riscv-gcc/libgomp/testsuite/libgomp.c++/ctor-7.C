// { dg-do run }

#include <omp.h>
#include <assert.h>

#define N 10

struct B
{
  static int icount;
  static int dcount;
  static int xcount;

  B();
  B(const B &);
  ~B();
  B& operator=(const B &);
  void doit();
};

int B::icount;
int B::dcount;
int B::xcount;

B::B()
{
  #pragma omp atomic 
    icount++;
}

B::~B()
{
  #pragma omp atomic
    dcount++;
}

void B::doit()
{
  #pragma omp atomic
    xcount++;
}

static int nthreads;

void foo()
{
  B b[N];
  #pragma omp parallel private(b)
    {
      #pragma omp master
	nthreads = omp_get_num_threads ();
      b[0].doit();
    }
}

int main()
{
  omp_set_dynamic (0);
  omp_set_num_threads (4);
  foo();

  assert (B::xcount == nthreads);
  assert (B::icount == (nthreads+1)*N);
  assert (B::dcount == (nthreads+1)*N);

  return 0;
}
