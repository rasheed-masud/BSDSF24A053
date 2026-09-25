CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
AR = ar
ARFLAGS = rcs

SRC_DIR = src
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin

LIB_OBJS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o
STATIC_LIB = $(LIB_DIR)/libmyutils.a
TARGET_STATIC = $(BIN_DIR)/client_static

all: $(TARGET_STATIC)

$(TARGET_STATIC): $(OBJ_DIR)/main.o $(STATIC_LIB) | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -L$(LIB_DIR) -lmyutils -o $@

$(STATIC_LIB): $(LIB_OBJS) | $(LIB_DIR)
	$(AR) $(ARFLAGS) $@ $^
	ranlib $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BIN_DIR) $(OBJ_DIR) $(LIB_DIR):
	mkdir -p $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR) sample.txt

.PHONY: all clean
