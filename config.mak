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

OPTS := -O2 -short-push
CFLAGS := +aos68k -c99 $(OPTS) -I$(NDK_INCLUDE)
LDFLAGS := +aos68k -final -L$(NDK_LIB)
ASFLAGS := -I$(NDK_INCLUDE)/asm

