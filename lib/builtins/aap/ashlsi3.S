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
  ; $r2, $r3  in
  ; $r4       amount
  ; $r4 is preserved across the call

  stw   [-$r1, 2],  $r5   ; save $r5
  movi  $r5,  16          ; $r5 = 16
  blts  0f,   $r4,  $r5

  ; amount >= 16
  sub   $r5,  $r4,  $r5
  lsl   $r3,  $r2,  $r5   ; out.hi = in.lo << (amount - 16)
  movi  $r2,  0           ; out.lo = 0
  bra   1f
0:
  ; amount < 16
  stw   [-$r1, 2],  $r6   ; save $r6
  sub   $r5,  $r5,  $r4   ; $r5 = 16 - amount
  lsr   $r6,  $r2,  $r5   ; $r6 = in.lo >> (16 - $r5)
  lsl   $r3,  $r3,  $r4   ; out.hi = in.hi << amount
  or    $r3,  $r3,  $r6   ; out.hi = out.hi | $r6
  lsl   $r2,  $r2,  $r4   ; out.lo = in.lo << amount
  ldw   $r6,  [$r1+, 2]   ; restore $r6
1:
  ldw   $r5,  [$r1+, 2]   ; restore $r5

  ; $r2, $r3  out
  jmp   $r0
