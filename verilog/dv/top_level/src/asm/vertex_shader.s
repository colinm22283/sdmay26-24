#include "defs.s"

; Performs vertex shading on a full triangle loaded
; from memory. The following global registers must be
; preloaded by the management core:
; g0 -> g15: MVP matrix
; g46: &index_buffer[0]
; g47: &vertex_buffer[0]

; Vectors must be of the form:
; struct vector { u32 x, u32 y, u32 z, u32 tx, u32 ty }

; This program can be done easily with loops, but it was
; unrolled for better performance. Bunching up memory
; accesses will result in better cache hit rates.

; Thread ID (tid) is loaded into r0 by the core controller
start:
add $r1, $g46, $tid

; Load triangle indices
lw $r2, 0[$r1]
lw $r3, 4[$r1]
lw $r4, 8[$r1]

; Load vertex 1
lw $r5, 0[$r2]
lw $r6, 4[$r2]
lw $r7, 8[$r2]
andi $r8, $r8, 0 ; Add homogeneous term
ori $r8, $r8, 1
lw $r9, 12[$r2]
lw $r10, 16[$r2]

; Vertex shade 1
dot4 $g0, $r5
macrd $r11
dot4 $g4, $r5
macrd $r12
dot4 $g8, $r5
macrd $r13
dot4 $g12, $r5
macrd $r14

; TODO: Ship this out to the rasterizer somehow

; Load vertex 2
lw $r5, 0[$r3]
lw $r6, 4[$r3]
lw $r7, 8[$r3]
andi $r8, $r8, 0 ; Add homogeneous term
ori $r8, $r8, 1
lw $r9, 12[$r3]
lw $r10, 16[$r3]

; Vertex shade 2
dot4 $g0, $r5
macrd $r11

; Load vertex 3
lw $r5, 0[$r4]
lw $r6, 4[$r4]
lw $r7, 8[$r4]
andi $r8, $r8, 0 ; Add homogeneous term
ori $r8, $r8, 1
lw $r9, 12[$r4]
lw $r10, 16[$r4]

; Vertex shade 3
dot4 $g0, $r5
macrd $r11

j start
