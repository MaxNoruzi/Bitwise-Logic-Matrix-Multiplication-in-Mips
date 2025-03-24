# 🧠 MIPS Assembly – Matrix Multiplication & Bitwise Logic Toolkit

This directory contains two focused MIPS assembly modules:

1. 🧮 Matrix Multiplication: Implements manual 2D array-based matrix multiplication with input/output handling.
2. 🔁 Bitwise Rotation: Performs left/right rotation on 32-bit words using shift and logical operations.

These projects demonstrate practical MIPS skills including pointer arithmetic, multi-level loop structures, bitwise logic, and syscall-based I/O.

---

## 📁 Files Overview

### 🔢 Matrix Multiplication

#### 1. `arrys mult.asm`
A complete implementation of matrix multiplication:
- Reads input dimensions: `m`, `n`, `k`
- Collects matrix A (m × n) and B (n × k)
- Computes matrix C = A × B
- Prints resulting matrix using `syscall`

📌 **Concepts demonstrated:**
- Manual array indexing using address arithmetic
- Nested loops for row-column computation
- Output formatting with spacing and newline

#### 2. `mips2.asm`
Another matrix multiplication variant (less complete):
- Performs the computation but **does not include output logic**
- Useful for comparing logic or testing pure arithmetic structure

✅ **Recommended**: Use `arrys mult.asm` as the full version.

---

### 🔁 Bitwise Rotation

#### 3. `rotator.asm`
Rotates a 32-bit word either **left or right** by a user-specified number of positions:
- Input:
  - A 32-bit integer
  - Direction (0 for left, 1 for right)
  - Number of positions to rotate
- Logic:
  - Uses `sll` (shift left logical) and `srl` (shift right logical)
  - Combines partial shifts using `or` to complete the rotation

📌 **Concepts demonstrated:**
- Bitwise operations
- Shift and combine logic
- Conditional branching based on rotation direction

#### 4. `mips12.asm`
Duplicate of `rotator.asm` with similar logic.  
✅ **Recommended**: Use `rotator.asm` for clarity and comments.

---

## 🧪 Educational Objectives

These programs are designed to reinforce:
- Matrix traversal and manual multiplication in assembly
- Bit-level manipulation and masking
- Loop nesting, condition checking, and memory offset math
- Use of `syscall` for user interaction and output

---

## 🔧 Requirements

- MIPS Simulator:
  - [MARS](http://courses.missouristate.edu/kenvollmar/mars/)
  - QtSPIM or SPIM

---

## 🚀 How to Run

1. Open `.asm` file in your MIPS simulator.
2. Run or step through the code.
3. Provide input as prompted (matrix elements, word to rotate, etc.).
4. Observe matrix output or rotation result printed to console.

---

## 📬 Contact

Use these files for educational demos, lab assignments, or testing MIPS skills.  
Suggestions and improvements are always welcome!

