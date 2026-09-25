# Project Report: PA-01 Build Systems and Libraries

## 1. Executive Summary
This project demonstrates the setup of modular C libraries using GNU Make, static archive generation (`ar`), and dynamic shared library generation with position-independent code (`fPICb).

## 2. Comparison: Static vs. Dynamic Linking

| Feature | Static Library (`.a`) | Dynamic Library (`.so`) |
m| --- | --- | --- |
m| **Linking Stage** | Link-time (code embedded into binary) | Load-time / Run-time |
m| **Executable Size** | Larger (includes library code) | Smaller (holds reference to libraries) |
m| **Memory Footprint** | Separate copy per process | Shared single copy in RAM |
m| **Updates** | Requires re-compiling the client | Swap `.so` file without client recompilation |

## 3. Verification
Both `client_static` and `client_dynamic` were compiled and verified under Linux/WSL environment. All tests for string length, copying, concatenation, line counting, and pattern matching passed cleanly.
