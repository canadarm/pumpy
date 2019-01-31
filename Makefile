# *makefile voice* hello
#

-include config.mak

SRCS := $(wildcard src/*.c) $(wildcard src/*.s)
OBJS := $(subst src/,obj/,$(SRCS:=.o))

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
	@rm -rf obj

