	# Sessio 3

	.data
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0

result:	.space 4

	.text
	.globl main

main:

	addiu $sp,$sp,-4	#obrim pila
	sw $ra,0($sp)		#no reg.segurs -> guardem $ra nomes

	la $a0, mat		#guardem @ a mat
	jal suma_col		#anem a la rutina

	lw $ra,0($sp)		#carreguem $ra un altre cop
	addiu $sp,$sp,4		#tanquem pila

	la $t7, result		#adreça a resultat
	sw $v0, 0($t7)		#guardem el resultat de la funcio a resultat

	jr $ra


suma_col:
	
	move $t0, $zero		#i = 0
 	li $t3, 4 		#comparacio amb 4
	move $v0, $zero 	#suma = 0	
	addiu $t1,$a0,8 	#punter a m[0][2]

for:
	lw $t2,0($t1) 		#m[i][2]
	addu $v0,$v0,$t2	#suma += m[i][2]
	addiu $t1,$t1,24 	#sumar stride al punter (6*4)
	addiu $t0,$t0,1		#++i
	blt $t0,$t3,for		#condicio i < 4

	jr $ra
