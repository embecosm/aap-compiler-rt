/* ===-- int_lib.h - configuration header for compiler-rt  -----------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file is a configuration header for compiler-rt.
 * This file is not part of the interface of this library.
 *
 * ===----------------------------------------------------------------------===
 */

#ifndef INT_LIB_H
#define INT_LIB_H

/* Assumption: Signed integral is 2's complement. */
/* Assumption: Right shift of signed negative is arithmetic shift. */
/* Assumption: Endianness is little or big (not mixed). */

/* ABI macro definitions */

#if __ARM_EABI__
# define ARM_EABI_FNALIAS(aeabi_name, name)         \
  void __aeabi_##aeabi_name() __attribute__((alias("__" #name)));
# define COMPILER_RT_ABI __attribute__((pcs("aapcs")))
#else
# define ARM_EABI_FNALIAS(aeabi_name, name)
# if defined(__arm__) && defined(_WIN32)
#   define COMPILER_RT_ABI __attribute__((pcs("aapcs")))
# else
#   define COMPILER_RT_ABI
# endif
#endif

#if defined(__NetBSD__) && (defined(_KERNEL) || defined(_STANDALONE))
/*
 * Kernel and boot environment can't use normal headers,
 * so use the equivalent system headers.
 */
#  include <machine/limits.h>
#  include <sys/stdint.h>
#  include <sys/types.h>
#else
/* Include the standard compiler builtin headers we use functionality from. */
#  include <limits.h>
#  include <stdint.h>
#  include <stdbool.h>
#  include <float.h>
#endif

/* Include the commonly used internal type definitions. */
#include "int_types.h"

/* Include internal utility function declarations. */
#include "int_util.h"

/* Define the corresponding builtins for clz with fixed size arguments. */
#if UINT_MAX == 4294967295
# define __builtin_clzhi(a) __builtin_clzs(a)
# define __builtin_clzsi(a) __builtin_clz(a)
# ifdef __LP64__
#   define __builtin_clzdi(a) __builtin_clzl(a)
# else
#   define __builtin_clzdi(a) __builtin_clzll(a)
# endif
#elif UINT_MAX == 65535
# define __builtin_clzhi(a) __builtin_clz(a)
# define __builtin_clzsi(a) __builtin_clzl(a)
# define __builtin_clzdi(a) __builtin_clzll(a)
#endif

/* Define the corresponding builtins for ctz with fixed size arguments. */
#if UINT_MAX == 4294967295
# define __builtin_ctzhi(a) __builtin_ctzs(a)
# define __builtin_ctzsi(a) __builtin_ctz(a)
# ifdef __LP64__
#   define __builtin_ctzdi(a) __builtin_ctzl(a)
# else
#   define __builtin_ctzdi(a) __builtin_ctzll(a)
# endif
#elif UINT_MAX == 65535
# define __builtin_ctzhi(a) __builtin_ctz(a)
# define __builtin_ctzsi(a) __builtin_ctzl(a)
# define __builtin_ctzdi(a) __builtin_ctzll(a)
#endif

COMPILER_RT_ABI si_int __paritysi2(si_int a);
COMPILER_RT_ABI si_int __paritydi2(di_int a);

COMPILER_RT_ABI di_int __divdi3(di_int a, di_int b);
COMPILER_RT_ABI si_int __divsi3(si_int a, si_int b);
COMPILER_RT_ABI su_int __udivsi3(su_int n, su_int d);

COMPILER_RT_ABI su_int __udivmodsi4(su_int a, su_int b, su_int* rem);
COMPILER_RT_ABI du_int __udivmoddi4(du_int a, du_int b, du_int* rem);
#ifdef CRT_HAS_128BIT
COMPILER_RT_ABI si_int __clzti2(ti_int a);
COMPILER_RT_ABI tu_int __udivmodti4(tu_int a, tu_int b, tu_int* rem);
#endif

#endif /* INT_LIB_H */
