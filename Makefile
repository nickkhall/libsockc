# Compiler
CC = gcc
LDFLAGS = -o $(BIN) $(LIBPATH) $(LIBS)
CFDEBUG = $(CFLAGS) -g -DDEBUG $(LDFLAGS)
RM = /bin/rm -f

SRC = src/sockc.c
HDR = include/sockc.h

BIN = libsockc
BINS = libsockc.so
BUILD_DIR = bin
LIB_DIR = lib
CFLAGS = -std=c18 -Wall

# All .c source files
SRC = src/sockc.c

all: $(BINS)

$(BINS): $(SRC) $(HDR)
	$(CC) -g -DDEBUG $(CFLAGS) -fPIC -shared -o $(LIB_DIR)/$@ $(SRC) -lc

# prevent confusion with any files named "clean"
.PHONY: clean
clean:
	$(RM) $(LIB_DIR)/*.o $(LIB_DIR)/*.so

debug_code:
	$(RM) debug/debug
	$(CC) -g -o debug/debug $(SRC) $(CFLAGS) $(INCLUDES) $(LIBS)



