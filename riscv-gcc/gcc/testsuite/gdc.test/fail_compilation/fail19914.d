// PERMUTE_ARGS:
/*
TEST_OUTPUT:
---
fail_compilation/fail19914.d(9): Error: undefined identifier `c` in module `fail19914`
fail_compilation/fail19914.d(10): Error: mixin `fail19914.a!string` error instantiating
---
*/
class a(b) { align.c d; }
mixin a!(string);
