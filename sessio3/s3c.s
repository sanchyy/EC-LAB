        # Sessio 3

        .data
mat:    .word 0,0,2,0,0,0
        .word 0,0,4,0,0,0
        .word 0,0,6,0,0,0
        .word 0,0,8,0,0,0
        .align 2
resultat: .space 4
        .text
        .globl main
main:
# Escriu aqui el teu codi del main
addiu $sp,$sp,-4
sw $ra,0($sp)
la $a0,mat
jal suma_col

la $t0,resultat
sw $v0,0($t0)
lw $ra,0($sp)
addi $sp,$sp,4

suma_col:
# Escriu aqui el teu codi de la subrutina
move $t0, $zero
move $t1, $zero
addiu $t2, $a0, 8
li $t3, 4

for:
lw $t4, 0($t2)
addu $t1, $t1, $t4
addiu $t2, $t2, 24
addiu $t0, $t0, 1
blt $t0, $t3, for
move $v0, $t1
jr $ra