# *makefile voice* hello
#

CC=vc
AS=vasm
LD=vc
OBJDUMP=vobjdump

OPTS = -O2 -short-push
CFLAGS = +aos68k -c99 $(OPTS)
LDFLAGS = +aos68k -final

SRCS = $(wildcard src/*.c) $(wildcard src/*.s)
OBJS = $(subst src/,obj/,$(SRCS:=.o))

all: pumpy

pumpy: obj $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

obj:
	@mkdir -p obj

obj/%.c.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

obj/%.s.o: src/%.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	@rm -f obj/*.o

