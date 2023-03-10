#ifndef _IPXE_ERRNO_LINUX_H
#define _IPXE_ERRNO_LINUX_H

/**
 * @file
 *
 * Linux platform error codes
 *
 * Linux error codes all fit inside 8 bits, so we just use them
 * directly as our platform error codes.
 */

FILE_LICENCE ( GPL2_OR_LATER_OR_UBDL );

/**
 * Convert platform error code to platform component of iPXE error code
 *
 * @v platform		Platform error code
 * @ret errno		Platform component of iPXE error code
 */
#define PLATFORM_TO_ERRNO( platform ) ( (platform) & 0xff )

/**
 * Convert iPXE error code to platform error code
 *
 * @v errno		iPXE error code
 * @ret platform	Platform error code
 */
#define ERRNO_TO_PLATFORM( errno ) ( (errno) & 0xff )

/* Platform-specific error codes */
#define PLATFORM_ENOERR 0
#define PLATFORM_E2BIG 7
#define PLATFORM_EACCES 13
#define PLATFORM_EADDRINUSE 98
#define PLATFORM_EADDRNOTAVAIL 99
#define PLATFORM_EAFNOSUPPORT 97
#define PLATFORM_EAGAIN 11
#define PLATFORM_EALREADY 114
#define PLATFORM_EBADF 9
#define PLATFORM_EBADMSG 74
#define PLATFORM_EBUSY 16
#define PLATFORM_ECANCELED 125
#define PLATFORM_ECHILD 10
#define PLATFORM_ECONNABORTED 103
#define PLATFORM_ECONNREFUSED 111
#define PLATFORM_ECONNRESET 104
#define PLATFORM_EDEADLK 35
#define PLATFORM_EDESTADDRREQ 89
#define PLATFORM_EDOM 33
#define PLATFORM_EDQUOT 122
#define PLATFORM_EEXIST 17
#define PLATFORM_EFAULT 14
#define PLATFORM_EFBIG 27
#define PLATFORM_EHOSTUNREACH 113
#define PLATFORM_EIDRM 43
#define PLATFORM_EILSEQ 84
#define PLATFORM_EINPROGRESS 115
#define PLATFORM_EINTR 4
#define PLATFORM_EINVAL 22
#define PLATFORM_EIO 5
#define PLATFORM_EISCONN 106
#define PLATFORM_EISDIR 21
#define PLATFORM_ELOOP 40
#define PLATFORM_EMFILE 24
#define PLATFORM_EMLINK 31
#define PLATFORM_EMSGSIZE 90
#define PLATFORM_EMULTIHOP 72
#define PLATFORM_ENAMETOOLONG 36
#define PLATFORM_ENETDOWN 100
#define PLATFORM_ENETRESET 102
#define PLATFORM_ENETUNREACH 101
#define PLATFORM_ENFILE 23
#define PLATFORM_ENOBUFS 105
#define PLATFORM_ENODATA 61
#define PLATFORM_ENODEV 19
#define PLATFORM_ENOENT 2
#define PLATFORM_ENOEXEC 8
#define PLATFORM_ENOLCK 37
#define PLATFORM_ENOLINK 67
#define PLATFORM_ENOMEM 12
#define PLATFORM_ENOMSG 42
#define PLATFORM_ENOPROTOOPT 92
#define PLATFORM_ENOSPC 28
#define PLATFORM_ENOSR 63
#define PLATFORM_ENOSTR 60
#define PLATFORM_ENOSYS 38
#define PLATFORM_ENOTCONN 107
#define PLATFORM_ENOTDIR 20
#define PLATFORM_ENOTEMPTY 39
#define PLATFORM_ENOTSOCK 88
#define PLATFORM_ENOTSUP PLATFORM_EOPNOTSUPP
#define PLATFORM_ENOTTY 25
#define PLATFORM_ENXIO 6
#define PLATFORM_EOPNOTSUPP 95
#define PLATFORM_EOVERFLOW 75
#define PLATFORM_EPERM 1
#define PLATFORM_EPIPE 32
#define PLATFORM_EPROTO 71
#define PLATFORM_EPROTONOSUPPORT 93
#define PLATFORM_EPROTOTYPE 91
#define PLATFORM_ERANGE 34
#define PLATFORM_EROFS 30
#define PLATFORM_ESPIPE 29
#define PLATFORM_ESRCH 3
#define PLATFORM_ESTALE 116
#define PLATFORM_ETIME 62
#define PLATFORM_ETIMEDOUT 110
#define PLATFORM_ETXTBSY 26
#define PLATFORM_EWOULDBLOCK PLATFORM_EAGAIN
#define PLATFORM_EXDEV 18

#endif /* _IPXE_ERRNO_LINUX_H */
