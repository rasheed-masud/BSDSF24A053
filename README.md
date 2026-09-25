# Operating Systems Assignment 1: Custom C Library & Build Systems

## Overview
This project implements custom utility functions for string manipulation and file operations in C. It supports direct compilation, static library linking (`.a`), and dynamic shared library linking (`.so`).

## Project Structure
- `include/`: Header files (`mystrfunctions.h , `myfilefunctions.h)
- `src/`: Implementation source files and `main.c`
- `lib/`: Compiled static (`libmyutils.a`) and dynamic (`libmyutils.so`) libraries
- `bin/`: Output executables (`client_static`, `client_dynamic`)
- `obj/`: Intermediate object files (`.o`, `_pic.o`)

## How to Build & Run

31. Build Everything
```bash
make
```

### 2. Run Static Executable
```bash
./bin/client_static`
```

### 3. Run Dynamic Executable
```bash
export LD_LIBRARY_PATH=$(pwd)/lib:$LD_LIBRARY_PATH
./bin/client_dynamic
```

### 4. Clean Build Artifacts
```bash
make clean
``g
