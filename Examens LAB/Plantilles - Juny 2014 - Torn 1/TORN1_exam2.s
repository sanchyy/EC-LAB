##########################################################
# COGNOMS, NOM:
##########################################################

.data
msg:      .asciiz " es perfecte\n"


.text
.globl main


############################################################
## ESCRIU AQUI EL CODI DE LA SUBRUTINA es_perfecte
############################################################
es_perfecte:






















############################################################
## NO MODIFIQUIS EL CODI QUE HI HA A PARTIR D'AQUÍ
############################################################
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	
	li	$s0, 2			# i = 2
_for:
	move 	$a0, $s0		# call es_perfecte(i)
	jal	es_perfecte
	
	beq	$v0, $zero, _else 	# if !es_perfecte(i) next loop cycle
	
	move	$a0, $s0
	li	$v0, 1
	syscall				# print  i
	la	$a0, msg
	li	$v0, 4
	syscall				# print  string
	
_else:	
	addiu 	$s0, $s0, 1
	li 	$t1, 100			# i < 100
	blt 	$s0, $t1, _for
	
	lw	$ra, 0($sp)		# return 
	addiu	$sp, $sp, 4
	jr 	$ra


suma:
	move	$v0, $zero		# aux = 0
_while:
	ble 	$a0, $zero, _end_while	# if cuantos == 0 go to endwhile2
	lw	$t1, 0($a1)		# *actual
	add	$v0, $v0, $t1		# aux += *actual
	addiu	$a1, $a1, 4		# actual ++
	addiu	$a0, $a0, -1		# cuantos --
	b	_while
_end_while:
	li 	$t0, 0x12345678
	move 	$t1, $t0
	move 	$t2, $t0
	move 	$t3, $t0
	move 	$t4, $t0
	move 	$t5, $t0
	move 	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move 	$a0, $t0
	move 	$a1, $t0
	move 	$a2, $t0
	move 	$a3, $t0
	jr 	$ra
