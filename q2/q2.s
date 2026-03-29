.section .rodata
fmt: .string "%d "

.section .text
.global main

main:
addi sp, sp, -8
sd ra, 0(sp)
mv s0, sp
mv s1, a0
mv s2, a1
slli a0, a0, 2
call malloc
mv s3, a0
li s4, 1
input:
beq s4, s1, stop
slli a2, s4, 3
add t0, a2, s2
ld a0, 0(t0)
call atoi
slli a2, s4, 2
add t0, a2, s3
sw a0, 0(t0)
addi s4, s4, 1
beq x0, x0, input
stop:

addi s4, s4, -1
stack:
beq s4, x0, out
slli a2, s4, 2
add t0, a2, s3
lw a3, 0(t0)
inner:
beq sp, s0, big
lw a4, 0(sp)
bgt a4, a3, big
addi sp, sp, 4
big:
beq sp, s0, st_1
lw a4, 0(sp)
add t0, a2, s3
sw a4, 0(t0)
beq x0, x0, add_to_stack
st_1:
li a4, -1
add t0, a2, s3
sw a4, 0(t0)
add_to_stack:
addi sp, sp, -4
sw a3, 0(sp)
addi s4, s4, -1
beq x0, x0, stack
out:
addi sp, s0, 0

li s4, 1
output:
beq s4, s1, end
slli a2, s4, 2
add t0, a2, s3
lw a1, 0(t0)
lla a0, fmt
call printf
addi s4, s4, 1
beq x0, x0, output
end:
ld ra, 0(sp)
addi sp, sp, 8
ret
