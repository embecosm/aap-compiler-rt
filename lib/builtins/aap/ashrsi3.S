/* ===-- ashrsi3.S - Implement __ashrsi3 -----------------------------------===
 *
 *                     The LLVM Compiler Infrastructure
 *
 * This file is dual licensed under the MIT and the University of Illinois Open
 * Source Licenses. See LICENSE.TXT for details.
 *
 * ===----------------------------------------------------------------------===
 *
 * This file implements __ashrsi3 for the compiler_rt library.
 *
 * ===----------------------------------------------------------------------===
 */

  .text
  .globl  __ashrsi3
  .align  1
  .type   __ashrsi3,@function
__ashrsi3:
  ; in_lo$r2
  ; in_hi$r3
  ; amount$r4

  ; $r2, $r3 used in return
  ; $r5 clobbered
  ; $r4 preserved
  stw   [-$r1, 2],  $r5  ; save $r5
  movi  $r5,  0
  beq   1f,   $r4,  $r5  ; if (amount$r4 == 0$r5)
  movi  $r5,  16
  blts  0f,   $r4,  $r5  ; else if (amount$r4 < 16$r5)
  sub   $r5,  $r4,  $r5    ; shift$r5 = amount$r4 - 16$r5:
  asr   $r2,  $r3,  $r5    ; out_lo$r2 = in_hi$r3 >> shift$r5
  movi  $r5,  15
  asr   $r3,  $r3,  $r5    ; out_hi$r3 = in_hi$r3 >> 15
  bra   1f
0:                        ; else
  lsr   $r2,  $r2,  $r4     ; out_lo$r2 = in_lo$r2 >> amount$r4
  sub   $r5,  $r5,  $r4     ; shift$r5  = 16$r5 - amount$r4
  lsl   $r5,  $r3,  $r5     ; tmp$r5    = in_hi$r3 << shift$r5
  or    $r2,  $r2,  $r5     ; out_lo$r2 |= tmp$r5
  asr   $r3,  $r3,  $r4     ; out_hi$r3 = in_hi$r3 >> amount$r4
1:
  ldw   $r5,  [$r1+, 2]
  jmp   $r0
