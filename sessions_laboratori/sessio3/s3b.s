        # Sessio 3

        .data
# Declara aqui les variables mat1, mat4 i col
mat1:   .space 120
        .align 2
mat4:   .word 2,3,1,2,4,3
col:    .word 2

        .text
        .globl main
main:
addiu $sp,$sp, -4
sw $ra, 0($sp)
la $a0, mat4
lw $a1,8($a0)
la $a2, col
lw $a2,0($a2)
jal subr
la $t0, mat1
addiu $t0,$t0, 108
sw $v0, 0($t0)
la $a0, mat4
li $a1,1
li $a2, 1
jal subr
la $t1, mat1
sw $v0,0($t1)
lw $ra, 0($sp)
addiu $sp,$sp, 4


subr:
la $t0, mat1
li $t1, 6
multu $a2,$t1 #i*NC (en aquest cas i és j)
mflo $t1
addiu $t1,$t1,5
sll $t1,$t1,2
addu $t0,$t0,$t1 #@M[j][5]
li $t1,3
multu $a1,$t1
mflo $t1 #i*NC
addu $t2,$t1,$a2
sll $t2,$t2,2

addu $t2,$t2,$a0
lw $t2, 0($t2)
sw $t2,0($t0)
move $v0,$a1
jr $ra

