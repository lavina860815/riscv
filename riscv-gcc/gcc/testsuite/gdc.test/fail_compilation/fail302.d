/*
TEST_OUTPUT:
---
fail_compilation/fail302.d(21): Error: cannot implicitly convert expression `1` of type `int` to `Bar`
---
*/

struct Bar
{
    uint num;

    Bar opAssign(uint otherNum)
    {
        num = otherNum;
        return this;
    }
}

void main()
{
    Bar bar = 1;	// disallow because construction is not assignment
    auto x = bar.num;
}
