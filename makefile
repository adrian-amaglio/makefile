BINS=main
main_o=plus.o main.o constante.o expressionBinaire.o

# Supported values : c cpp #
CODE=cpp

# Libraries needed #
INCLUDES=

# Makes gcc speak english #
LANG=c


# Standard conf #
ifeq ($(CODE), cpp)
	CC=g++
	LD=g++
endif
ifeq ($(CODE), c)
	CC=gcc
	LD=gcc
endif

SRC_EXT=.$(CODE)
CFLAGS=-Wall -Werror -g
DEP=$(patsubst %$(SRC_EXT), %.dep, $(wildcard *$(SRC_EXT)))

################## Rules ##################

# Not a file to look for #
.PHONY: default all clean dep clear locale
default: all 

-include $(DEP)
all: clear dep $(BINS)
main: $(main_o)

%.o: %$(SRC_EXT)
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

clean:
	rm -f *.o $(BINS) *.dep
%.dep: %$(SRC_EXT)
	$(CC) -MM $< > $@
dep: $(DEP)
clear:
	clear
