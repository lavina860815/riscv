#include <pthread.h>
#include <stdio.h>

extern "C" const char *__tsan_default_options() {
  return "report_bugs=0";
}

int Global;

void *Thread1(void *x) {
  Global = 42;
  return NULL;
}

void *Thread2(void *x) {
  Global = 43;
  return NULL;
}

int main() {
  pthread_t t[2];
  pthread_create(&t[0], NULL, Thread1, NULL);
  pthread_create(&t[1], NULL, Thread2, NULL);
  pthread_join(t[0], NULL);
  pthread_join(t[1], NULL);
  fprintf(stderr, "DONE\n");
  return 0;
}

/* { dg-prune-output "WARNING: ThreadSanitizer: data race.*(\n|\r\n|\r)" } */
/* { dg-output "DONE" } */
