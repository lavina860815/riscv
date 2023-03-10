#define FNNAME1(NAME) exec_ ## NAME
#define FNNAME(NAME) FNNAME1(NAME)

void FNNAME (INSN_NAME) (void)
{
  /* vector_res = OP(vector, vector3, vector4),
     then store the result.  */
#define TEST_VMLXL1(INSN, T1, T2, W, W2, N)				\
  VECT_VAR(vector_res, T1, W, N) =                                      \
    INSN##_##T2##W2(VECT_VAR(vector, T1, W, N),                         \
                    VECT_VAR(vector3, T1, W2, N),                       \
                    VECT_VAR(vector4, T1, W2, N));                      \
  vst1q_##T2##W(VECT_VAR(result, T1, W, N), VECT_VAR(vector_res, T1, W, N))

#define TEST_VMLXL(INSN, T1, T2, W, W2, N)	\
  TEST_VMLXL1(INSN, T1, T2, W, W2, N)

  DECL_VARIABLE(vector, int, 16, 8);
  DECL_VARIABLE(vector3, int, 8, 8);
  DECL_VARIABLE(vector4, int, 8, 8);
  DECL_VARIABLE(vector_res, int, 16, 8);

  DECL_VARIABLE(vector, int, 32, 4);
  DECL_VARIABLE(vector3, int, 16, 4);
  DECL_VARIABLE(vector4, int, 16, 4);
  DECL_VARIABLE(vector_res, int, 32, 4);

  DECL_VARIABLE(vector, int, 64, 2);
  DECL_VARIABLE(vector3, int, 32, 2);
  DECL_VARIABLE(vector4, int, 32, 2);
  DECL_VARIABLE(vector_res, int, 64, 2);

  DECL_VARIABLE(vector, uint, 16, 8);
  DECL_VARIABLE(vector3, uint, 8, 8);
  DECL_VARIABLE(vector4, uint, 8, 8);
  DECL_VARIABLE(vector_res, uint, 16, 8);

  DECL_VARIABLE(vector, uint, 32, 4);
  DECL_VARIABLE(vector3, uint, 16, 4);
  DECL_VARIABLE(vector4, uint, 16, 4);
  DECL_VARIABLE(vector_res, uint, 32, 4);

  DECL_VARIABLE(vector, uint, 64, 2);
  DECL_VARIABLE(vector3, uint, 32, 2);
  DECL_VARIABLE(vector4, uint, 32, 2);
  DECL_VARIABLE(vector_res, uint, 64, 2);

  clean_results ();

  VLOAD(vector, buffer, q, int, s, 16, 8);
  VLOAD(vector, buffer, q, int, s, 32, 4);
  VLOAD(vector, buffer, q, int, s, 64, 2);
  VLOAD(vector, buffer, q, uint, u, 16, 8);
  VLOAD(vector, buffer, q, uint, u, 32, 4);
  VLOAD(vector, buffer, q, uint, u, 64, 2);

  VDUP(vector3, , int, s, 8, 8, 0x55);
  VDUP(vector4, , int, s, 8, 8, 0xBB);
  VDUP(vector3, , int, s, 16, 4, 0x55);
  VDUP(vector4, , int, s, 16, 4, 0xBB);
  VDUP(vector3, , int, s, 32, 2, 0x55);
  VDUP(vector4, , int, s, 32, 2, 0xBB);
  VDUP(vector3, , uint, u, 8, 8, 0x55);
  VDUP(vector4, , uint, u, 8, 8, 0xBB);
  VDUP(vector3, , uint, u, 16, 4, 0x55);
  VDUP(vector4, , uint, u, 16, 4, 0xBB);
  VDUP(vector3, , uint, u, 32, 2, 0x55);
  VDUP(vector4, , uint, u, 32, 2, 0xBB);

  TEST_VMLXL(INSN_NAME, int, s, 16, 8, 8);
  TEST_VMLXL(INSN_NAME, int, s, 32, 16, 4);
  TEST_VMLXL(INSN_NAME, int, s, 64, 32, 2);
  TEST_VMLXL(INSN_NAME, uint, u, 16, 8, 8);
  TEST_VMLXL(INSN_NAME, uint, u, 32, 16, 4);
  TEST_VMLXL(INSN_NAME, uint, u, 64, 32, 2);

  CHECK(TEST_MSG, int, 16, 8, PRIx16, expected, "");
  CHECK(TEST_MSG, int, 32, 4, PRIx32, expected, "");
  CHECK(TEST_MSG, int, 64, 2, PRIx64, expected, "");
  CHECK(TEST_MSG, uint, 16, 8, PRIx16, expected, "");
  CHECK(TEST_MSG, uint, 32, 4, PRIx32, expected, "");
  CHECK(TEST_MSG, uint, 64, 2, PRIx64, expected, "");
}

int main (void)
{
  FNNAME (INSN_NAME) ();
  return 0;
}
