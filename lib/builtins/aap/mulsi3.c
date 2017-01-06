/* ===--------------- mul3i3.c - Implement __mul3i3 ------------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __mul3i3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

#include "../int_lib.h"

si_int __mulsi3(si_int a, si_int b)
{
  unsigned long res = 0;

  unsigned long sign = ((a < 0) == (b < 0)) ? 0 : 0x80000000;
  unsigned long lhs = (a < 0) ? -a : a;
  unsigned long rhs = (b < 0) ? -b : b;

  for (int i = 0; i < 32; i++) {
    if (rhs & 1)
      res += lhs;
    rhs >>= 1;
    lhs <<= 1;
  }

  return (res & 0x7fffffff) | sign;
}

