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
  unsigned long long res = 0;

  for (int i = 0; i < 32; i++) {
    if (b & 1)
      res += a;
    b >>= 1;
    a <<= 1;
  }

  return (res & 0xFFFFFFFF);
}

