	.data
signe:		.word 0
exponent:	.word 0
mantissa:	.word 0
cfixa:		.word 0x87D18A00
cflotant:	.float 0.0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)

	la	$t0, cfixa
	lw	$a0, 0($t0)
	la	$a1, signe
	la	$a2, exponent
	la	$a3, mantissa
	jal	descompon

	la	$a0, signe
	lw	$a0,0($a0)
	la	$a1, exponent
	lw	$a1,0($a1)
	la	$a2, mantissa
	lw	$a2,0($a2)
	jal	compon

	la	$t0, cflotant
	swc1	$f0, 0($t0)

	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr	$ra


descompon:
	lw $t1,0($a1)
	slti $a0, $a0, 0
	sw $t1,0($a1)
	sll $a0,$a0,1
	bne $a1,$zero,else
if:	move $t3,$zero #exp
	b endlse
else:	li $t3,18 #exp
while:	bltu $a0,$zero,	end
	sll $a0,$a0,1
	addiu $t3,$t3,-1
	b while
end:	sra $a0,$a0,8
	li $t4,0x7FFFFF
	and $a0,$a0,$t4
	addiu $t3,$t3,127
endlse:	sw $t3,0($a2)
	sw $a1,0($a3)
	
	
compon:
	sll $t1,$a0,31
	sll $t2,$a1,23
	or $t1,$t1,$t2
	or $t1,$t1,$a2
	move $v0, $t1
