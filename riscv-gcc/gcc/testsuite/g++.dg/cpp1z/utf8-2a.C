// This macro should not be 201411 without -std=c++17.

#if __cpp_unicode_characters == 201411
#error Wrong value for __cpp_unicode_characters
#endif
