/* ===--------------- mulhi3.c - Implement __mulhi3 ------------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __mulhi3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

#include "../int_lib.h"

hi_int __mulhi3(hi_int a, hi_int b)
{
  unsigned long res = 0;

  for (int i = 0; i < 16; i++) {
    if (b & 1)
      res += a;
    b >>= 1;
    a <<= 1;
  }

  return (res & 0xFFFF);
}

