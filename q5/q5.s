.section .rodata
file: .string "input.txt"
yes: .string "Yes\n"
no: .string "No\n"

.section .bss
buf1: .skip 1
buf2: .skip 1

.section .text
.global main
main:
addi sp, sp, -8
sd ra, 0(sp)
li a0, -100
lla a1, file
li a2, 0
li a3, 0
li a7, 56
ecall
mv s0, a0
mv a0, s0
li a1, 0
li a2, 2
li a7, 62
ecall
mv s1, a0
li s2, 0
addi s1, s1, -1

loop:
bge s2, s1, y
mv a0, s0
mv a1, s2
li a2, 0
li a7, 62
ecall
mv a0, s0
lla a1, buf1
li a2, 1
li a7, 63
ecall 

lb s3, buf1

mv a0, s0
mv a1, s1
li a2, 0
li a7, 62
ecall
mv a0, s0
lla a1, buf2
li a2, 1
li a7, 63
ecall 

lb s4, buf2
bne s3, s4, n
addi s2, s2, 1
addi s1, s1, -1
beq x0, x0, loop

y:
lla a0, yes
call printf
beq x0, x0, exit

n:
lla a0, no
call printf

exit:
ld ra, 0(sp)
addi sp, sp, 8
ret
