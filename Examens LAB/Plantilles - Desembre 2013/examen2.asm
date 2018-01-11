# Plantilla creada per PETRU RARES SINCRAIAN
	.data
V:	.word 12, -3, 24, 41, -7, 5, 9, 1
M:	.space 256
resultat: .space 4

	.text
	.globl main
main:	
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	la 	$a0, V
	la 	$a1, M
	li 	$a2, 8
	jal	func
	la 	$t0, resultat
	sw 	$v0, 0($t0)
	
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr $ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra
	
func:
	addiu $sp,$sp,-20
	sw $s0,0($sp)		#&A
	sw $s1,4($sp)		#n
	sw $s2,8($sp)		#i
	sw $s3,12($sp)		#*p
	sw $ra,16($sp)		#$ra

	move $s0,$a0
	move $s1,$a2
	move $s2,$zero		#i = 0
	addi $s3,$a1,+28	#B[0][7]

for:

	bge $s2,$s1,fi_for

	lw $t1,0($s0)
	ble $t1,$zero,fi_if
	move $a0,$s3
	move $a1,$s0

	jal posar

fi_if:

	addi $s3,$s3,32
	addi $s0,$s0,4
	addi $s2,$s2,1
	j for

fi_for:

	lw $v0, -32($s3)

	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addiu $sp,$sp,20

	jr $ra

posar:
	
	lw $t7, 0($a1)
	sw $t7,0($a0)

	addiu $sp,$sp,-4
	sw $ra,,0($sp)
	jal nofares 

	lw $ra,0($sp)
	addiu $sp,$sp,4

	jr $ra

