#if !defined(DECCONTEXTSYMBOLS)
#define DECCONTEXTSYMBOLS

#ifdef IN_LIBGCC2
#define decContextClearStatus __decContextClearStatus
#define decContextDefault __decContextDefault
#define decContextGetRounding __decContextGetRounding
#define decContextGetStatus __decContextGetStatus
#define decContextRestoreStatus __decContextRestoreStatus
#define decContextSaveStatus __decContextSaveStatus
#define decContextSetRounding __decContextSetRounding
#define decContextSetStatus __decContextSetStatus
#define decContextSetStatusFromString __decContextSetStatusFromString
#define decContextSetStatusFromStringQuiet __decContextSetStatusFromStringQuiet
#define decContextSetStatusQuiet __decContextSetStatusQuiet
#define decContextStatusToString __decContextStatusToString
#define decContextTestSavedStatus __decContextTestSavedStatus
#define decContextTestStatus __decContextTestStatus
#define decContextZeroStatus __decContextZeroStatus
#define DECPOWERS __decPOWERS
#define DECSTICKYTAB __decSTICKYTAB
#endif

#endif
