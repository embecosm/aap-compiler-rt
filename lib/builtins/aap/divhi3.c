/* ===--------------- divhi3.c - Implement __divhi3 ------------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __divhi3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

#include "../int_lib.h"

COMPILER_RT_ABI si_int
__divsi3(si_int a, si_int b);

hi_int __divhi3(hi_int a, hi_int b)
{
  return __divsi3(a, b);
}

