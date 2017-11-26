## This makefile take every sourcefile in the curent directory, compile it alone, and like them all in the BIN file.

################## Configuration #######################
# Final Binary name #
BIN=main

# Supported values : c cpp (will become your source file extention too) #
CODE=cpp

# Libraries needed #
INCLUDES=

# gcc options #
CFLAGS=-Wall -Werror -g std=c++14

# Makes gcc speak english #
export LANG=en_US.utf8

################# Infered configuration ######################
ifeq ($(CODE), cpp)
	CC=g++
	LD=g++
endif
ifeq ($(CODE), c)
	CC=gcc
	LD=gcc
endif

SRC_EXT=.$(CODE)
DEP=$(patsubst %$(SRC_EXT), %.dep, $(wildcard *$(SRC_EXT)))
main_o=$(patsubst %$(SRC_EXT), %.o, $(wildcard *$(SRC_EXT)))

################## Rules ##################

# Not a file to look for #
.PHONY: default all clean dep clear locale

default: all 

-include $(DEP)
all: clear dep $(BIN)
main: $(main_o)

%.o: %$(SRC_EXT)
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

clean:
	rm -f *.o $(BIN) *.dep

%.dep: %$(SRC_EXT)
	$(CC) -MM $< > $@
dep: $(DEP)

clear:
	clear
