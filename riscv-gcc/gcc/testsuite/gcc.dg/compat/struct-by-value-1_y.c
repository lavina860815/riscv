#define T(N)							\
struct S##N { unsigned char i[N]; };				\
extern struct S##N g1s##N, g2s##N, g3s##N;			\
								\
extern void check##N (struct S##N x, int i);			\
extern void test2_##N (struct S##N s1, struct S##N s2);		\
								\
void								\
init##N (struct S##N *p, int i)					\
{								\
  int j;							\
  for (j = 0; j < N; j++)					\
    p->i[j] = i + j;						\
}								\
								\
void								\
checkg##N (void)						\
{								\
  check##N (g1s##N, 64);					\
  check##N (g2s##N, 128);					\
  check##N (g3s##N, 192);					\
}								\
								\
void								\
test##N (struct S##N s1, struct S##N s2,			\
			 struct S##N s3)			\
{								\
  check##N (s1, 64);						\
  check##N (s2, 128);						\
  check##N (s3, 192);						\
}

#ifndef SKIP_ZERO_ARRAY
T(0)
#endif
T(1) T(2) T(3) T(4) T(5) T(6) T(7)
T(8) T(9) T(10) T(11) T(12) T(13) T(14) T(15)
T(16) T(17) T(18) T(19) T(20) T(21) T(22) T(23)
T(24) T(25) T(26) T(27) T(28) T(29) T(30) T(31)
T(32) T(33) T(34) T(35) T(36) T(37) T(38) T(39)
T(40) T(41) T(42) T(43) T(44) T(45) T(46) T(47)
T(48) T(49) T(50) T(51) T(52) T(53) T(54) T(55)
T(56) T(57) T(58) T(59) T(60) T(61) T(62) T(63)
