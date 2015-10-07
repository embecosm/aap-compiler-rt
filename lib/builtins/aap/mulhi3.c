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

int __mulhi3(int a, int b)
{
  unsigned int res = 0;

  unsigned sign = ((a < 0) == (b < 0)) ? 0 : 0x8000;
  unsigned lhs = (a < 0) ? -a : a;
  unsigned rhs = (b < 0) ? -b : b;

  for (int i = 0; i < 16; i++) {
    if (rhs & 1)
      res += lhs;
    rhs >>= 1;
    lhs <<= 1;
  }

  return (res & 0x7fff) | sign;
}

