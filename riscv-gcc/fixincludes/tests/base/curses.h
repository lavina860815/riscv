/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/curses.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( AIX_NULL_CHECK )
# define	NULL 	(0L)  /* typed NULL */
#endif  /* AIX_NULL_CHECK */


#if defined( AVOID_BOOL_DEFINE_CHECK )
#ifndef __cplusplus
# define bool	 char 
#endif

#endif  /* AVOID_BOOL_DEFINE_CHECK */


#if defined( AVOID_BOOL_TYPE_CHECK )
#ifndef __cplusplus
typedef unsigned int	bool 	;
#endif /* bool
 type */
#endif  /* AVOID_BOOL_TYPE_CHECK */


#if defined( BAD_STRUCT_TERM_CHECK )
struct term;
#endif  /* BAD_STRUCT_TERM_CHECK */


#if defined( VOID_NULL_CHECK )
#ifndef NULL
#ifdef __cplusplus
#ifdef __GNUG__
#define NULL __null
#else /* ! __GNUG__  */
#define NULL 0L
#endif /* __GNUG__  */
#else /* ! __cplusplus  */
#define NULL ((void *)0)
#endif /* __cplusplus  */
#endif /* !NULL  */  /* typed NULL */
#endif  /* VOID_NULL_CHECK */
