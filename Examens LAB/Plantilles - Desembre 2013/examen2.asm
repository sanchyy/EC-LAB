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

posar:
