# AAP.mk -- Top level makefile for AAP compiler-rt.
#
# Contributor Edward Jones <ed.jones@embecosm.com>.
#
# This file is distributed under the University of Illinois Open Source
# License. See LICENSE.TXT for details.

# Set compilers, archivers and flags
CC = aap-cc
AR = aap-ar r
CFLAGS = -O2 $(EXTRA_CFLAGS)

# This list is derived from GENERIC_SOURCES in lib/builtins/CMakeLists.txt
# 		atomic.c and enable_execute_stack.c are not supported
SOURCES = \
  absvdi2.c \
  absvsi2.c \
  absvti2.c \
  adddf3.c \
  addsf3.c \
  addtf3.c \
  addvdi3.c \
  addvsi3.c \
  addvti3.c \
  apple_versioning.c \
  ashldi3.c \
  ashlti3.c \
  ashrdi3.c \
  ashrti3.c \
  clear_cache.c \
  clzdi2.c \
  clzsi2.c \
  clzti2.c \
  cmpdi2.c \
  cmpti2.c \
  comparedf2.c \
  comparesf2.c \
  ctzdi2.c \
  ctzsi2.c \
  ctzti2.c \
  divdc3.c \
  divdf3.c \
  divdi3.c \
  divmoddi4.c \
  divmodsi4.c \
  divsc3.c \
  divsf3.c \
  divsi3.c \
  divti3.c \
  divtf3.c \
  divxc3.c \
  eprintf.c \
  extendsfdf2.c \
  extendhfsf2.c \
  ffsdi2.c \
  ffsti2.c \
  fixdfdi.c \
  fixdfsi.c \
  fixdfti.c \
  fixsfdi.c \
  fixsfsi.c \
  fixsfti.c \
  fixunsdfdi.c \
  fixunsdfsi.c \
  fixunsdfti.c \
  fixunssfdi.c \
  fixunssfsi.c \
  fixunssfti.c \
  fixunsxfdi.c \
  fixunsxfsi.c \
  fixunsxfti.c \
  fixxfdi.c \
  fixxfti.c \
  floatdidf.c \
  floatdisf.c \
  floatdixf.c \
  floatsidf.c \
  floatsisf.c \
  floattidf.c \
  floattisf.c \
  floattixf.c \
  floatundidf.c \
  floatundisf.c \
  floatundixf.c \
  floatunsidf.c \
  floatunsisf.c \
  floatuntidf.c \
  floatuntisf.c \
  floatuntixf.c \
  int_util.c \
  lshrdi3.c \
  lshrti3.c \
  moddi3.c \
  modsi3.c \
  modti3.c \
  muldc3.c \
  muldf3.c \
  muldi3.c \
  mulodi4.c \
  mulosi4.c \
  muloti4.c \
  mulsc3.c \
  mulsf3.c \
  multi3.c \
  multf3.c \
  mulvdi3.c \
  mulvsi3.c \
  mulvti3.c \
  mulxc3.c \
  negdf2.c \
  negdi2.c \
  negsf2.c \
  negti2.c \
  negvdi2.c \
  negvsi2.c \
  negvti2.c \
  paritydi2.c \
  paritysi2.c \
  parityti2.c \
  popcountdi2.c \
  popcountsi2.c \
  popcountti2.c \
  powidf2.c \
  powisf2.c \
  powitf2.c \
  powixf2.c \
  subdf3.c \
  subsf3.c \
  subvdi3.c \
  subvsi3.c \
  subvti3.c \
  subtf3.c \
  trampoline_setup.c \
  truncdfhf2.c \
  truncdfsf2.c \
  truncsfhf2.c \
  ucmpdi2.c \
  ucmpti2.c \
  udivdi3.c \
  udivmoddi4.c \
  udivmodsi4.c \
  udivmodti4.c \
  udivsi3.c \
  udivti3.c \
  umoddi3.c \
  umodsi3.c \
  umodti3.c \
            \
  ashrsi3.c \
  ashlsi3.c \
  divhi3.c \
  lshrsi3.c \
  modhi3.c \
  mulhi3.c \
  mulsi3.c \
  udivhi3.c \
  umodhi3.c

OBJECTS = $(patsubst %.S,%.o,$(SOURCES:.c=.o))

LIB = libcompiler_rt.a

$(LIB): $(OBJECTS)
	$(AR) $(LIB) $(OBJECTS)

%.o: lib/builtins/aap/%.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: lib/builtins/aap/%.S
	$(CC) $(CFLAGS) -c $< -o $@

%.o: lib/builtins/%.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(OBJECTS) $(LIB)
