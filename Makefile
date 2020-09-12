# Compiler
CC = gcc
LDFLAGS = -o $(BIN) $(LIBPATH) $(LIBS)
CFDEBUG = $(CFLAGS) -g -DDEBUG $(LDFLAGS)
RM = /bin/rm -f

SRC = src/sockets.c
HDR = includes/sockets.h

BIN = libsockc
BINS = libsockc.so
BUILD_DIR = bin
LIB_DIR = lib
CFLAGS = -std=c18 -Wall

# All .c source files
SRC = src/sockets.c
OUT_DIR = lib
OUT = libsockc.so

.PHONY: all
all: $(OUT)

$(OUT): $(subst .c,.o,$(SRC))
	$(CC) $(CLAGS) -shared -fpic -o $(OUT_DIR)/$@ $^

# prevent confusion with any files named "clean"
.PHONY: clean
clean:
	$(RM) $(LIB_DIR)/*.o $(LIB_DIR)/*.so

debug_code:
	$(RM) debug/debug
	$(CC) -g -o debug/debug $(SRC) $(CFLAGS) $(INCLUDES) $(LIBS)




