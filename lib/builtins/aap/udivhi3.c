/* ===--------------- udivhi3.c - Implement __udivhi3 ----------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __udivhi3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

#include "../int_lib.h"

COMPILER_RT_ABI su_int
__udivsi3(su_int a, su_int b);

hu_int __udivhi3(hu_int a, hu_int b)
{
  return __udivsi3(a, b);
}

