/*
TEST_OUTPUT:
---
fail_compilation/ice15441.d(24): Error: variable ice15441.main.__front$n$ type void is inferred from initializer __r$n$.front(), and variables cannot be of type void
fail_compilation/ice15441.d(24): Error: expression __r$n$.front() is void and has no value
fail_compilation/ice15441.d(24): Error: `s1.front` is void and has no value
fail_compilation/ice15441.d(27): Error: cannot infer argument types, expected 1 argument, not 2
---
*/

struct S1
{
    auto front()() {}
}

struct S2
{
    auto front()() { return 1; }
}

void main()
{
    S1 s1;
    foreach (p, e; s1) {}

    S2 s2;
    foreach (p, e; s2) {}
}
