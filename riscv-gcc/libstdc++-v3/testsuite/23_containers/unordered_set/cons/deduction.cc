// { dg-options "-std=gnu++17" }
// { dg-do compile { target c++17 } }

#include <unordered_set>
#include <testsuite_allocator.h>

using __gnu_test::SimpleAllocator;

static_assert(std::is_same_v<
	      decltype(std::unordered_set{1, 2, 3}),
	      std::unordered_set<int>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    0, std::hash<int>{}, {}}),
	      std::unordered_set<int>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    {}}),
	      std::unordered_set<int>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    1, std::allocator<int>{}}),
	      std::unordered_set<int>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    1, SimpleAllocator<int>{}}),
	      std::unordered_set<int, std::hash<int>,
	      std::equal_to<int>,
	      SimpleAllocator<int>>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    1, std::hash<int>{}, std::allocator<int>{}}),
	      std::unordered_set<int>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    1, std::hash<int>{}, SimpleAllocator<int>{}}),
	      std::unordered_set<int, std::hash<int>,
	      std::equal_to<int>,
	      SimpleAllocator<int>>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    {}, {}, {}, std::allocator<int>{}}),
	      std::unordered_set<int>>);

static_assert(std::is_same_v<
	      decltype(std::unordered_set{{1, 2, 3},
		    {}, {}, {}, SimpleAllocator<int>{}}),
	      std::unordered_set<int, std::hash<int>,
	      std::equal_to<int>,
	      SimpleAllocator<int>>>);

void f()
{
  std::unordered_set<int> x;

  static_assert(std::is_same_v<
		decltype(std::unordered_set(x.begin(), x.end())),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      {},
		      std::hash<int>{},
		      std::equal_to<int>{},
		      std::allocator<int>{}}),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      {}, std::hash<int>{}, {}}),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set(x.begin(), x.end(),
		      {})),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(), 1}),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      1,
		      std::allocator<int>{}}),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      1,
		      SimpleAllocator<int>{}}),
		std::unordered_set<int, std::hash<int>,
		std::equal_to<int>,
		SimpleAllocator<int>>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      1, std::hash<int>{},
		      std::allocator<int>{}}),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      1, std::hash<int>{},
		      SimpleAllocator<int>{}}),
		std::unordered_set<int, std::hash<int>,
		std::equal_to<int>,
		SimpleAllocator<int>>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      {}, {}, {},
		      std::allocator<int>{}}),
		std::unordered_set<int>>);

  static_assert(std::is_same_v<
		decltype(std::unordered_set{x.begin(), x.end(),
		      {}, {}, {},
		      SimpleAllocator<int>{}}),
		std::unordered_set<int, std::hash<int>,
		std::equal_to<int>,
		SimpleAllocator<int>>>);
}
