CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
PICFLAGS = -fPIC
AR = ar
ARFLAGS = rcs

SRC_DIR = src
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin

STATIC_LIB = $(LIB_DIR)/libmyutils.a
SHARED_LIB = $(LIB_DIR)/libmyutils.so

TARGET_STATIC = $(BIN_DIR)/client_static
TARGET_DYNAMIC = $(BIN_DIR)/client_dynamic

all: $(TARGET_STATIC) $(TARGET_DYNAMIC)

$(TARGET_STATIC): $(OBJ_DIR)/main.o $(STATIC_LIB) | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -L$(LIB_DIR) -lmyutils -o $@

$(TARGET_DYNAMIC): $(OBJ_DIR)/main.o $(SHARED_LIB) | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -L$(LIB_DIR) -lmyutils -o $@

$(STATIC_LIB): $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o | $(LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^
	ranlib $@

$(SHARED_LIB): $(OBJ_DIR)/mystrfunctions_pic.o $(OBJ_DIR)/myfilefunctions_pic.o | $(LIB_DIR)
	$(CC) -shared $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%_pic.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) $(PICFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR) $(LIB_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR) sample.txt

.PHONY: all clean

PREFIX ?= /usr/local

install:
	@echo "Installing binaries and man pages..."
	install -d $(PREFIX)/bin
	install -m 755 bin/client_static $(PREFIX)/bin/
	install -m 755 bin/client_dynamic $(PREFIX)/bin/
	install -d $(PREFIX)/share/man/man3
	install -m 644 man/man3/*.3 $(PREFIX)/share/man/man3/
	@echo "Installation complete!"

uninstall:
	rm -f $(PREFIX)/bin/client_static
	rm -f $(PREFIX)/bin/client_dynamic
	rm -f $(PREFIX)/share/man/man3/mystrfunctions.3
	rm -f $(PREFIX)/share/man/man3/myfilefunctions.3
	@echo "Uninstallation complete!"
