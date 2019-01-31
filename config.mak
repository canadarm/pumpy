# config settings for amiga toolchain
# this configuration is based on VBCC and NDK.
# this NDK configuration changes paths from the
# distributed package for no good reason.
#


CC := vc
AS := vasm
LD := vc
OBJDUMP := vobjdump

NDK := /opt/ndk
NDK_INCLUDE := $(NDK)/include
NDK_LIB := $(NDK)/lib

VBCC_LIB := $(VBCC)/targets/m68k-amigaos/lib
CRT0 := $(VBCC_LIB)/minstart.o

OPTS := -sc -sd -O2 -short-push
CFLAGS := +aos68k -c99 -nostdlib $(OPTS) -I$(NDK_INCLUDE)
LDFLAGS := +aos68k -nostdlib -mrel -final -L$(NDK_LIB) -L$(VBCC_LIB) $(CRT0)
ASFLAGS := -Fhunk -m68000 -quiet -I$(NDK_INCLUDE)/asm

INST := $(HOME)/amiga

