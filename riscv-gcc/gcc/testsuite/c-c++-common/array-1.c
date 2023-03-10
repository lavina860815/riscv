// PR c++/90947 - Simple lookup table of array of strings is miscompiled
// { dg-do compile }
// { dg-options "-O1 -fdump-tree-optimized" }

#define assert(expr) ((expr) ? (void)0 : __builtin_abort ())

void pr90947 (void)
{
  int vecsize = 4;
  int index = 0;
  static const char *a[4][4] =
    {
     { ".x", ".y", ".z", ".w" },
     { ".xy", ".yz", ".zw", 0 },
     { ".xyz", ".yzw", 0, 0 },
     { "", 0, 0, 0 },
    };

  assert (vecsize >= 1 && vecsize <= 4);
  assert (index >= 0 && index < 4);
  assert (a[vecsize - 1][index]);
}

void f_a1_1 (void)
{
  {
    const char* a[1][1] = { { 0 } };
    assert (0 == a[0][0]);
  }
  {
    const char* a[1][1] = { { "" } };
    assert ('\0' == *a[0][0]);
  }
}

void f_a2_1 (void)
{
  {
    const char* a[2][1] = { { "" }, { "" } };
    assert ('\0' == *a[0][0] && '\0' == *a[1][0]);
  }
  {
    const char* a[2][1] = { { 0 }, { "" } };
    assert (0 == a[0][0] && '\0' == *a[1][0]);
  }
  {
    const char* a[2][1] = { { }, { "" } };
    assert (0 == a[0][0] && '\0' == *a[1][0]);
  }
}

void f_a2_2 (void)
{
  {
    const char* a[2][2] = { { "", "" }, { "", "" } };
    assert ('\0' == *a[0][0] && '\0' == *a[0][1]);
    assert ('\0' == *a[1][0] && '\0' == *a[1][1]);
  }
  {
    const char* a[2][2] = { { "", "" }, { "", 0 } };
    assert ('\0' == *a[0][0] && '\0' == *a[0][1]);
    assert ('\0' == *a[1][0] && 0 == a[1][1]);
  }
  {
    const char* a[2][2] = { { "", "" }, { "" } };
    assert ('\0' == *a[0][0] && '\0' == *a[0][1]);
    assert ('\0' == *a[1][0] && 0 == a[1][1]);
  }
  {
    const char* a[2][2] = { { "", "" }, { 0, "" } };
    assert ('\0' == *a[0][0] && '\0' == *a[0][1]);
    assert (0 == a[1][0] && '\0' == *a[1][1]);
  }
  {
    const char* a[2][2] = { { "", 0 }, { 0, "" } };
    assert ('\0' == *a[0][0] && 0 == a[0][1]);
    assert (0 == a[1][0] && '\0' == *a[1][1]);
  }
  {
    const char* a[2][2] = { { 0, 0 }, { 0, "" } };
    assert (0 == a[0][0] && 0 == a[0][1]);
    assert (0 == a[1][0] && '\0' == *a[1][1]);
  }
  {
    const char* a[2][2] = { { 0 }, { 0, "" } };
    assert (0 == a[0][0] && 0 == a[0][1]);
    assert (0 == a[1][0] && '\0' == *a[1][1]);
  }
  {
    const char* a[2][2] = { { }, { 0, "" } };
    assert (0 == a[0][0] && 0 == a[0][1]);
    assert (0 == a[1][0] && '\0' == *a[1][1]);
  }
}

void f_a2_2_2 (void)
{
  {
    const char* a[2][2][2] =
      { { { "", "" }, { "", "" } }, { { "", "" }, { "", "" } } };

    assert ('\0' == *a[0][0][0] && '\0' == *a[0][0][1]);
    assert ('\0' == *a[0][1][0] && '\0' == *a[0][1][1]);
    assert ('\0' == *a[1][0][0] && '\0' == *a[1][0][1]);
    assert ('\0' == *a[1][1][0] && '\0' == *a[1][1][1]);
  }

  {
    const char* a[2][2][2] =
      { { { "", "" }, { "", "" } }, { { "", "" }, { 0, "" } } };

    assert ('\0' == *a[0][0][0] && '\0' == *a[0][0][1]);
    assert ('\0' == *a[0][1][0] && '\0' == *a[0][1][1]);
    assert ('\0' == *a[1][0][0] && '\0' == *a[1][0][1]);
    assert (0 == a[1][1][0] && '\0' == *a[1][1][1]);
  }

  {
    const char* a[2][2][2] =
      { { { "", "" }, { "", "" } }, { { 0, 0 }, { 0, "" } } };

    assert ('\0' == *a[0][0][0] && '\0' == *a[0][0][1]);
    assert ('\0' == *a[0][1][0] && '\0' == *a[0][1][1]);
    assert (0 == a[1][0][0] && 0 == a[1][0][1]);
    assert (0 == a[1][1][0] && '\0' == *a[1][1][1]);
  }

  {
    const char* a[2][2][2] =
      { { { "", "" }, { 0, 0 } }, { { 0, 0 }, { 0, "" } } };

    assert ('\0' == *a[0][0][0] && '\0' == *a[0][0][1]);
    assert (0 == a[0][1][0] && 0 == a[0][1][1]);
    assert (0 == a[1][0][0] && 0 == a[1][0][1]);
    assert (0 == a[1][1][0] && '\0' == *a[1][1][1]);
  }

  {
    const char* a[2][2][2] =
      { { { 0, 0 }, { 0, 0 } }, { { 0, 0 }, { 0, "" } } };

    assert (0 == a[0][0][0] && 0 == a[0][0][1]);
    assert (0 == a[0][1][0] && 0 == a[0][1][1]);
    assert (0 == a[1][0][0] && 0 == a[1][0][1]);
    assert (0 == a[1][1][0] && '\0' == *a[1][1][1]);
  }

  {
    const char* a[2][2][2] =
      { { { }, { } }, { { }, { 0, "" } } };

    assert (0 == a[0][0][0] && 0 == a[0][0][1]);
    assert (0 == a[0][1][0] && 0 == a[0][1][1]);
    assert (0 == a[1][0][0] && 0 == a[1][0][1]);
    assert (0 == a[1][1][0] && '\0' == *a[1][1][1]);
  }
}

void f_sa2_2_2 (void)
{
  struct S { const char a[2], *s, c; };

  {
    const struct S a[2][2][2] = {
      { },
      {
        { { }, { "", "" } },
        { }
      }
    };

    assert ('\0' == *a[0][0][0].a && 0 == a[0][0][0].s && 0 == a[0][0][0].c);
    assert ('\0' == *a[0][0][1].a && 0 == a[0][0][1].s && 0 == a[0][0][1].c);
    assert ('\0' == *a[0][1][0].a && 0 == a[0][1][0].s && 0 == a[0][1][0].c);
    assert ('\0' == *a[0][1][1].a && 0 == a[0][1][1].s && 0 == a[0][1][1].c);

    assert ('\0' == *a[1][0][0].a && 0 == a[1][0][0].s && 0 == a[1][0][0].c);
    assert ('\0' == *a[1][0][1].a && '\0' == *a[1][0][1].s && 0 == a[1][0][1].c);
    assert ('\0' == *a[1][1][0].a && 0 == a[1][1][0].s && 0 == a[1][1][0].c);
    assert ('\0' == *a[1][1][1].a && 0 == a[1][1][1].s && 0 == a[1][1][1].c);
  }

  {
    const struct S a[2][2][2] = {
      { },
      {
        { { } },
        { { "", "" } }
      }
    };

    assert ('\0' == *a[0][0][0].a && 0 == a[0][0][0].s);
    assert ('\0' == *a[0][0][1].a && 0 == a[0][0][1].s);
    assert ('\0' == *a[0][1][0].a && 0 == a[0][1][0].s);
    assert ('\0' == *a[0][1][1].a && 0 == a[0][1][1].s);

    assert ('\0' == *a[1][0][0].a && 0 == a[1][0][0].s);
    assert ('\0' == *a[1][0][1].a && 0 == a[1][0][1].s);
    assert ('\0' == *a[1][1][0].a && '\0' == *a[1][1][0].s);
    assert ('\0' == *a[1][1][1].a && 0 == a[1][1][1].s);
  }

  {
    const struct S a[2][2][2] = {
      { },
      {
        { { }, { } },
        { { }, { "", "", 0 } }
      }
    };

    assert ('\0' == *a[0][0][0].a && 0 == a[0][0][0].s);
    assert ('\0' == *a[0][0][1].a && 0 == a[0][0][1].s);
    assert ('\0' == *a[0][1][0].a && 0 == a[0][1][0].s);
    assert ('\0' == *a[0][1][1].a && 0 == a[0][1][1].s);

    assert ('\0' == *a[1][0][0].a && 0 == a[1][0][0].s);
    assert ('\0' == *a[1][0][1].a && 0 == a[1][0][1].s);
    assert ('\0' == *a[1][1][0].a && 0 == a[1][1][0].s);
    assert ('\0' == *a[1][1][1].a && '\0' == *a[1][1][1].s);
  }

  {
    const struct S a[2][2][2] = {
      {
       { { { 0 }, 0, 0 }, { { 0 } , 0, 0 } },
       { { { 0 }, 0, 0 }, { { 0 } , 0, 0 } },
      },
      {
       { { { 0 }, 0, 0 }, { { 0 } , 0, 0 } },
       { { }, { "", "", 0 } }
      }
    };

    assert ('\0' == *a[0][0][0].a && 0 == a[0][0][0].s);
    assert ('\0' == *a[0][0][1].a && 0 == a[0][0][1].s);
    assert ('\0' == *a[0][1][0].a && 0 == a[0][1][0].s);
    assert ('\0' == *a[0][1][1].a && 0 == a[0][1][1].s);

    assert ('\0' == *a[1][0][0].a && 0 == a[1][0][0].s);
    assert ('\0' == *a[1][0][1].a && 0 == a[1][0][1].s);
    assert ('\0' == *a[1][1][0].a && 0 == a[1][1][0].s);
    assert ('\0' == *a[1][1][1].a && '\0' == *a[1][1][1].s);
  }
}

// { dg-final { scan-tree-dump-not "abort" "optimized" } }
