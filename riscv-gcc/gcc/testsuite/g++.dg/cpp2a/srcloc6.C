// { dg-do compile { target c++2a } }

namespace std {
  struct source_location {
  };
}

auto x = __builtin_source_location ();	// { dg-error "'__impl' is not a member of 'std::source_location'" }
// { dg-message "evaluating '__builtin_source_location'" "" { target *-*-* } .-1 }
