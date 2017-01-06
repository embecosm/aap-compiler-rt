/* ===--------------- umodhi3.c - Implement __umodhi3 ----------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __umodhi3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

#include "../int_lib.h"

COMPILER_RT_ABI su_int
__umodsi3(su_int a, su_int b);

hu_int __umodhi3(hu_int a, hu_int b)
{
  return __umodsi3(a, b);
}

