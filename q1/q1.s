.section .text
.global make_node
.global insert
.global get
.global getAtMost
make_node:
addi sp, sp, -16
sw a0, 0(sp)
sd ra, 8(sp)
li a0, 24
call malloc
lw a1, 0(sp)
sw a1, 0(a0)
li a2, 0
sd a2, 8(a0)
sd a2, 16(a0)
ld ra, 8(sp)
addi sp, sp, 16
ret

insert:
addi sp, sp, -16
sd ra, 0(sp)
sd a0, 8(sp)
beq x0, a0, make
lw a2, 0(a0)
blt a1, a2, go_left

ld a0, 16(a0)
jal insert
ld a3, 8(sp)
sd a0, 16(a3)
addi a0, a3, 0
ld ra, 0(sp)
addi sp, sp, 16
ret

go_left:
ld a0, 8(a0)
jal insert
ld a3, 8(sp)
sd a0, 8(a3)
addi a0, a3, 0
ld ra, 0(sp)
addi sp, sp, 16
ret

make:
addi a0, a1, 0
jal make_node
ld ra, 0(sp)
addi sp, sp, 16
ret

get:
addi sp, sp, -8
sd ra, 0(sp)
beq a0, x0, return
lw a2, 0(a0)
beq a2, a1, return
blt a1, a2, s_l

ld a0, 16(a0)
jal get
beq x0, x0, return

s_l:
ld a0, 8(a0)
jal get

return:
ld ra, 0(sp)
addi sp, sp, 8
ret

getAtMost:
li a2, -1
loop:
beq a1, x0, exit
lw a3, 0(a1)
beq a0, a3, ret_val
blt a3, a0, l

ld a1, 8(a1)
beq x0, x0, loop

l:
addi a2, a3, 0
ld a1, 16(a1)
beq x0, x0, loop


exit:
addi a0, a2, 0
ret

ret_val:
ret
