CC = gcc
CFLAGS = -Wall -Iinclude

all: bin/main

bin/main: src/main.c src/mystrfunctions.c src/myfilefunctions.c
	@mkdir -p bin
	$(CC) $(CFLAGS) -o bin/main src/main.c src/mystrfunctions.c src/myfilefunctions.c

clean:
	rm -rf bin obj lib

.PHONY: all clean
