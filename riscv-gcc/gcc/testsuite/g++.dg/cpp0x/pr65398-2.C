// PR c++/65398
// { dg-do compile { target c++11 } }

#define SA(X) static_assert((X),#X)

constexpr char s[] = "abc";

SA((&s[0] + 0) == (&s[0] + 0));
SA((&s[0] + 1) == (&s[1] + 0));
SA((&s[0] + 2) == (&s[1] + 1));
SA((&s[0] + 3) == (&s[1] + 2));
SA((&s[0] + 4) == (&s[1] + 3));
SA((&s[2] + 0) == (&s[0] + 2));
SA((&s[2] + 1) == (&s[3] + 0));
SA((&s[2] + 2) == (&s[3] + 1));
SA((&s[4] + 0) == (&s[2] + 2));

SA((&s[0] + 0) != (&s[1] + 0));
SA((&s[0] + 2) != (&s[1] + 0));
SA((&s[2] + 0) != (&s[2] + 1));
SA((&s[1] + 1) != (&s[0] + 1));

constexpr int l[] = { 'c', 'd', 'e', '\0' };

SA((&l[0] + 0) == (&l[0] + 0));
SA((&l[0] + 1) == (&l[1] + 0));
SA((&l[0] + 2) == (&l[1] + 1));
SA((&l[0] + 3) == (&l[1] + 2));
SA((&l[0] + 4) == (&l[1] + 3));
SA((&l[2] + 0) == (&l[0] + 2));
SA((&l[2] + 1) == (&l[3] + 0));
SA((&l[2] + 2) == (&l[3] + 1));
SA((&l[4] + 0) == (&l[2] + 2));

SA((&l[0] + 0) != (&l[1] + 0));
SA((&l[0] + 2) != (&l[1] + 0));
SA((&l[2] + 0) != (&l[2] + 1));
SA((&l[1] + 1) != (&l[0] + 1));
