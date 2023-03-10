/* { dg-shouldfail "tsan" } */
/* { dg-additional-options "-ldl" } */

#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include "tsan_barrier.h"

static pthread_barrier_t barrier;

struct A {
  A() {
    sem_init(&sem_, 0, 0);
  }
  virtual void F() {
  }
  void Done() {
    sem_post(&sem_);
  }
  virtual ~A() {
    sem_wait(&sem_);
    sem_destroy(&sem_);
  }
  sem_t sem_;
};

struct B : A {
  virtual void F() {
  }
  virtual ~B() { }
};

static A *obj = new B;

void *Thread1(void *x) {
  obj->F();
  obj->Done();
  barrier_wait(&barrier);
  return NULL;
}

void *Thread2(void *x) {
  barrier_wait(&barrier);
  delete obj;
  return NULL;
}

int main() {
  barrier_init(&barrier, 2);
  pthread_t t[2];
  pthread_create(&t[0], NULL, Thread1, NULL);
  pthread_create(&t[1], NULL, Thread2, NULL);
  pthread_join(t[0], NULL);
  pthread_join(t[1], NULL);
}

/* { dg-output "WARNING: ThreadSanitizer: data race on vptr.*(\n|\r\n|\r)" } */
