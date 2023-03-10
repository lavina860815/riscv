// { dg-do compile }
// { dg-options "-fopenmp" }

struct S
{
  #pragma omp declare simd linear(this)		// { dg-error "is not a function argument" }
  static void foo ();
  void bar ();
};

void
S::bar ()
{
  #pragma omp parallel firstprivate (this)	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp parallel for lastprivate (this)	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
  for (int i = 0; i < 10; i++)
    ;
  #pragma omp parallel shared (this)		// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp for linear (this)			// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
  for (int i = 0; i < 10; i++)
    ;
  #pragma omp task depend(inout: this)		// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp task depend(inout: this[0])	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp parallel private (this)		// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
  {
    #pragma omp single copyprivate (this)	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  }
}

template <int N>
struct T
{
  #pragma omp declare simd linear(this)		// { dg-error "is not a function argument" }
  static void foo ();
  void bar ();
};

template <int N>
void
T<N>::bar ()
{
  #pragma omp parallel firstprivate (this)	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp parallel for lastprivate (this)	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
  for (int i = 0; i < 10; i++)
    ;
  #pragma omp parallel shared (this)		// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp for linear (this)			// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
  for (int i = 0; i < 10; i++)
    ;
  #pragma omp task depend(inout: this)		// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp task depend(inout: this[0])	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  #pragma omp parallel private (this)		// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
  {
    #pragma omp single copyprivate (this)	// { dg-error ".this. allowed in OpenMP only in .declare simd. clauses" }
    ;
  }
}

template struct T<0>;
