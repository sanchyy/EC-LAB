###########################################################
## NOM I COGNOMS:
###########################################################

.data
V1:	.word 2,-3,6,2,-8,5,6,2
V2:	.word 0,0,0,0,0,0,0,0
V3:	.word 0,0,0,0,0,0,0,0
res1:	.word 0
res2:	.word 0

.globl	main
.text 

############################################################
## ESCRIU AQUI EL CODI DE LA SUBRUTINA buscar
############################################################
buscar:






















############################################################
## NO MODIFIQUIS EL CODI QUE HI HA A PARTIR D'AQUÍ
############################################################
comptar:
lw $t0,0($a1)
addiu $t0,$t0,1
sw $t0,0($a1)
li $t1,-1
sw $t1,0($a0)
li $t0, 0x12345678
move $t1, $t0
move $t2, $t0
move $t3, $t0
move $t4, $t0
move $t5, $t0
move $t6, $t0
move $t7, $t0
move $t8, $t0
move $t9, $t0
move $a0, $t0
move $a1, $t0
move $a2, $t0
move $a3, $t0
jr $ra


main:
addiu $sp,$sp,-4
sw $ra,0($sp)

la $a0,V1
la $a1,V2
la $a2,2
jal buscar
la $t0,res1
sw $v0,0($t0)
la $a0,V1
la $a1,V3
la $a2,6
jal buscar
la $t0,res2
sw $v0,0($t0)

lw $ra,0($sp)
addiu $sp,$sp,4
jr $ra

  
    
	








