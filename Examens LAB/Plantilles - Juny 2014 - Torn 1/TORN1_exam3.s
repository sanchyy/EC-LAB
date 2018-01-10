# PROGRAMA DE PROVES. TORN 1, PREGUNTA 3
# AQUEST FITXER NO S'HA DE LLIURAR

	.data
V:	.space 32
M:	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3
	.word 0, 1, 2, 3, 0, 1, 2, 3

	.text
	.globl main
main:
	la	$t0, V			# punter a V
	la	$t1, M			# punter a M
	move	$t2, $zero		# i=0
	li	$t3, 8
fori:
	bge	$t2, $t3, fifori
	move	$t4, $zero		# j=0
	move	$t5, $t0		# punter a V
forj:
	bge	$t4, $t3, fiforj
	lw	$t6, 0($t1)
	addiu	$t1, $t1, 4		# avancem punter a M

	lw	$t7, 0($t5)
	addu	$t7, $t7, $t6
	sw	$t7, 0($t5)
	addiu	$t5, $t5, 4		# avancem punter a V
	addiu	$t4, $t4, 1		# j++
	b	forj
fiforj:
	addiu	$t2, $t2, 1		# i++
	b	fori
fifori:
	jr	$ra

