	.data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

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


moda:
        addiu $sp, $sp, -68
        sw $ra, 64($sp)
        sw $s0, 60($sp)
        sw $s1, 56($sp)
        sw $s2, 52($sp)
        sw $s3, 48($sp)
        sw $s4, 44($sp)
        li $t1, 0
        li $t2, 10
        move $t5, $sp
bucle1:
        bge $t1,$t2, fi_bucle1
        sw $zero, 0($t5)
        addiu $t1, $t1, 1
        addiu $t5, $t5, 4
        b bucle1
fi_bucle1:
        li $s0, 0
        li $s1, '0'
        move $s2, $a0
        move $s3, $a1
        move $s4, $sp
bucle2:
        bge $s0, $s3, fi_bucle2
        move $a0, $s4
        addu $t3, $s0, $s2
        lb $t3,0($t3)
        li $t0, '0'
        subu $a1, $t3, $t0
        subu $a2, $s1, $t0
        jal update
        addiu $s1, $v0, '0'
        addiu $s0, $s0, 1
        j bucle2
fi_bucle2:
        move $v0, $s1
        lw $ra, 64($sp)
        lw $s0, 60($sp)
        lw $s1, 56($sp)
        lw $s2, 52($sp)
        lw $s3, 48($sp)
        lw $s4, 44($sp)
        addiu $sp, $sp,68
        jr $ra
update:
        addiu $sp, $sp, -16
        sw $ra, 12($sp)
        sw $s0, 8($sp)
        sw $s1, 4($sp)
        sw $s2, 0($sp)
        move $s0, $a0
        move $s1, $a1
        move $s2, $a2
        jal nofares
        sll $t1, $s1, 2
        addu $t2, $t1, $s0
        lw $t3, 0($t2)
        addiu $t3, $t3, 1
        sw $t3, 0 ($t2)
        sll $t4, $s2, 2
        addu $t5, $t4, $s0
        lw $t6, 0($t5)
        bge $t6, $t3, else1
        move $v0, $s1
        b final
else1:  
        move $v0, $s2
final: 
        lw $ra, 12($sp)
        lw $s0, 8($sp)
        lw $s1, 4($sp)
        lw $s2, 0($sp)
        addiu $sp, $sp, 16
        jr $ra