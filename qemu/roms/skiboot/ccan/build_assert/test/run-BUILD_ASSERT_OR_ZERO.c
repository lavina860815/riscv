#include <ccan/build_assert/build_assert.h>
#include <ccan/tap/tap.h>

int __attribute__((const)) main(int argc, char *argv[])
{
	(void)argc;
	(void)argv;

	plan_tests(1);
	ok1(BUILD_ASSERT_OR_ZERO(1 == 1) == 0);
	return exit_status();
}
