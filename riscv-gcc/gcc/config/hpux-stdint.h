
/* These should be correct for ia64-hp-hpux11.23.  */

#define SIG_ATOMIC_TYPE "unsigned int"

#define INT8_TYPE "signed char"
#define INT16_TYPE "short int"
#define INT32_TYPE "int"
#define INT64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
#define UINT8_TYPE "unsigned char"
#define UINT16_TYPE "short unsigned int"
#define UINT32_TYPE "unsigned int"
#define UINT64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")

#define INT_LEAST8_TYPE "signed char"
#define INT_LEAST16_TYPE "short int"
#define INT_LEAST32_TYPE "int"
#define INT_LEAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
#define UINT_LEAST8_TYPE "unsigned char"
#define UINT_LEAST16_TYPE "short unsigned int"
#define UINT_LEAST32_TYPE "unsigned int"
#define UINT_LEAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")

#define INT_FAST8_TYPE "int"
#define INT_FAST16_TYPE "int"
#define INT_FAST32_TYPE "int"
#define INT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
#define UINT_FAST8_TYPE "unsigned int"
#define UINT_FAST16_TYPE "unsigned int"
#define UINT_FAST32_TYPE "unsigned int"
#define UINT_FAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")

#define INTPTR_TYPE "long int"
#define UINTPTR_TYPE "long unsigned int"
