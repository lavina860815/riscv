/*
TEST_OUTPUT:
---
fail_compilation/fail247.d-mixin-9(9): Error: identifier expected, not `EOF`
fail_compilation/fail247.d-mixin-9(9): Error: `;` expected after mixin
---
*/

mixin(`mixin`);
