//  { dg-do run }

// Test the ability to specialize the coroutine traits to include
// non-class type coroutine ramp return values.

#include "../coro.h"

template<typename R, typename HandleRef, typename ...T>
struct std::coroutine_traits<R, HandleRef, T...> {
    struct promise_type {
        promise_type (HandleRef h, T ...args)
        { h = std::coroutine_handle<promise_type>::from_promise (*this);
          PRINT ("Created Promise");
        }

        void get_return_object() {}

        auto initial_suspend() {
          return std::suspend_always{};
         }
        auto final_suspend() { return std::suspend_never{}; }

        void return_void() {}
        void unhandled_exception() {}
    };
};

void
my_coro (std::coroutine_handle<>& h)
{
  PRINT ("coro1: about to return");
  co_return;
}

int main ()
{
  std::coroutine_handle<> h;
  my_coro (h);

  if (h.done())
    {
      PRINT ("main: apparently was already done...");
      abort ();
    }

  // initial suspend.
  h.resume ();
  
  if (!h.done())
    {
      PRINT ("main: apparently wasn't done...");
      abort ();
    }

  PRINT ("main: returning");
  return 0;
}
