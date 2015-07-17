/* ===-- ashlsi3.S - Implement __ashlsi3 -----------------------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __ashlsi3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

  .text
  .globl  __ashlsi3
  .align  1
  .type   __ashlsi3,@function
__ashlsi3:
  mov   $r7,  16
  blts  0f, $r5,  $r7
  ; amount >= 16
  sub   $r5,  $r5,  $r7
  lsl   $r4,  $r3,  $r5   ; hi_out = lo_in << (amount - 16)
  mov   $r3,  0           ; lo_out = 0
  bra   1f
0:
  ; amount < 16
  sub   $r7,  $r7,  $r5   ; 16 - amount
  lsl   $r4,  $r4,  $r5   ; hi_out = hi_out << (amount)
  lsr   $r7,  $r3,  $r7   ; r7 = lo_in >> (16 - amount)
  or    $r4,  $r4,  $r7   ; hi_out |= r7
  lsl   $r3,  $r3,  $r5   ; lo_out = lo_in << amount
1:
  jmp   $r0
