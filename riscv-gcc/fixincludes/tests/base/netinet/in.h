/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/netinet/in.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( HPUX_HTONL_CHECK )
#if 1
/*
 * Macros for number representation conversion.
 */
#ifndef ntohl
#define ntohl(x)        (x)
#define ntohs(x)        (x)
#define htonl(x)        (x)
#define htons(x)        (x)
#endif
#endif  /* ! _XOPEN_SOURCE_EXTENDED */
#endif  /* HPUX_HTONL_CHECK */
