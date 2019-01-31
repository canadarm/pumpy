# *makefile voice* hello
#

-include config.mak

SRCS := $(wildcard src/*.c) $(wildcard src/*.s)
OBJS := $(subst src/,obj/,$(SRCS:=.o))
LIBS := amigas

all: pumpy

pumpy: obj $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(addprefix -l,$(LIBS))

obj:
	@mkdir -p obj

obj/%.c.o: src/%.c
	$(CC) $(CFLAGS) -I./include -c $< -o $@

obj/%.s.o: src/%.s
	$(AS) $(ASFLAGS) -I./include $< -o $@

install: all $(INST)
	@cp pumpy $(INST)

$(INST):
	@mkdir -p $@

clean:
	@rm -rf obj

