# 🖥️ Operating Systems — Assignment 01: Custom C Library & Build Systems

Welcome to the repository for **Programming Assignment 01**, focusing on modular C programming, static and dynamic library linking, build automation using Makefiles, and system documentation/installation workflows.

---

## 📂 Project Structure

The project follows a clean, professional Linux directory layout:

| Directory | Description |
| :--- | :--- |
| **`include/`** | Header files (`mystrfunctions.h`, `myfilefunctions.h`) |
| **`src/`** | Implementation source files and the driver program (`main.c`) |
| **`lib/`** | Compiled static (`libmyutils.a`) and dynamic (`libmyutils.so`) libraries |
| **`bin/`** | Output executable programs (`client_static`, `client_dynamic`) |
| **`obj/`** | Intermediate object files (`.o`, `_pic.o`) |
| **`man/`** | Standard Linux man pages (`man3/`) |

---

## 🚀 How to Build & Run

### 1. Build Everything

Compile all modules, static/dynamic libraries, and executables using the `make` utility:

```bash
make
```

### 2. Run the Static Executable

Run the statically linked client program:

```bash
./bin/client_static
```

### 3. Run the Dynamic Executable

The dynamic executable requires the system to locate the shared library.

Temporarily add the project's `lib/` directory to `LD_LIBRARY_PATH`:

```bash
export LD_LIBRARY_PATH=$(pwd)/lib:$LD_LIBRARY_PATH
```

Then run the dynamic executable:

```bash
./bin/client_dynamic
```

### 4. System Installation (Optional)

To install the binaries and manual pages system-wide:

```bash
sudo make install
```

### 5. Clean Build Artifacts

To remove compiled binaries, libraries, and object files:

```bash
make clean
```

---

## 🛠️ Build Components

This project demonstrates the following concepts:

- Modular C programming
- Header files and source files
- Static library creation (`libmyutils.a`)
- Dynamic/shared library creation (`libmyutils.so`)
- Object file compilation
- Position Independent Code (PIC)
- Static linking
- Dynamic linking
- Makefile-based build automation
- Linux environment variables
- System-wide installation
- Linux manual pages

---

## 📚 Documentation

Manual pages are provided under the `man/man3/` directory.

After installation, the manual pages can be accessed using:

```bash
man mystrfunctions
```

or:

```bash
man myfilefunctions
```

---

## 🧹 Cleaning the Project

To remove all generated build artifacts and return the project to a clean state:

```bash
make clean
```

This removes generated:

- Object files
- Static libraries
- Dynamic libraries
- Executable binaries

---

## 📁 Expected Directory Structure

After building the project, the directory structure should look similar to:

```text
.
├── include/
│   ├── mystrfunctions.h
│   └── myfilefunctions.h
│
├── src/
│   ├── main.c
│   ├── mystrfunctions.c
│   └── myfilefunctions.c
│
├── lib/
│   ├── libmyutils.a
│   └── libmyutils.so
│
├── bin/
│   ├── client_static
│   └── client_dynamic
│
├── obj/
│   ├── *.o
│   └── *_pic.o
│
├── man/
│   └── man3/
│
├── Makefile
└── README.md
```

---

## 👤 Author

**Name:** Masud  
**Roll Number:** BSDSF24A053
