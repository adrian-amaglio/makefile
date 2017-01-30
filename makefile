CC=gcc
LD=gcc
CFLAGS=-Wall -Werror
DEP=$(patsubst %.c, %.dep, $(wildcard *.c))

-include $(DEPS)

.PHONY: default
default:
	@echo "cibles valides : essai_pile all clean" 

.PHONY: all
all: essai_pile

%.o: %.c
	$(CC) $(CFLAGS) -c $<

essai_pile: pile.o pile_io.o essai_pile.o
	$(CC) -o $@ $^
.PHONY: clean
clean:
	rm *.o essai_pile *.dep
%.dep: %.c
	gcc -MM $< > $@
dep: $(DEP)

