// origin PR debug/49047
// { dg-options "-gdwarf-2 -dA -fno-merge-debug-strings" }
// { dg-do compile }

struct K
{
  K () { }
  ~K () { }
};

int
main()
{
  K k;
}

// { dg-final {scan-assembler-times " DW_AT_\[MIPS_\]*linkage_name" 4 } }
