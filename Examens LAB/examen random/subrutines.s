
.data
V1:	.word 2,-3,6,2,-8,5,6,2
V2:	.word 0,0,0,0,0,0,0,0
V3:	.word 0,0,0,0,0,0,0,0
res1:	.space 4
res2:	.space 4

.globl	main
.text 

main:

	addiu $sp,$sp,-4 	#obrim pila
	sw $ra, 0($sp)		#guardem $ra, unic registre segur

	la $a0,V1			#carreguem adreça v1 a primer parametre
	la $a1,V2			#carreguem adreça v2 a segon parametre
	li $a2,2			#paràmetre 3 de la funcio = 2

	jal buscar			#saltem a la funcio

	la $t7,res1			#carreguem adreça de res1
	sw $v0,0($t7)		#guardem resultat funcio a res1

	la $a0,V1			#adreça v1 primer paràmetre
	la $a1,V3			#adreça v3 segon paràmetre
	li $a2,6			#tercer paràmentre = 6

	jal buscar			#saltem a la funcio buscar

	la $t6, res2		#carreguem adreça res2
	sw $v0, 0($t6)		#guardem resultat de la funcio a res2

	lw $ra, 0($sp)		#guardem $ra a $ra xd
	addiu $sp,$sp,4		#tanquem la pila

	jr $ra
	
buscar:

	addiu $sp,$sp,-24 	#&A,&B,cont,$ra -> pila
	sw $zero,0($sp)		#a $sp hi guardem cont
	sw $s0,4($sp)		#i (por si acaso)
	sw $s1,8($sp)		#c -> pila
	sw $s2,12($sp)		#&B -> pila
	sw $s3,16($sp)		#&A -> pila
	sw $ra,20($sp)		#$ra -> pila

	move $s3,$a0		#guardem @ d'A a un segur
	move $s2,$a1		#guardem @ de B a un segur
	move $s1,$a2		#guardem c a un segur

	move $s0, $zero 	#i = 0

for:
	li $t0, 8			#per la condicio <8
	bge $s0,$t0,fi_for	#i >= 8 -> fi_for
	
	lw $t1, 0($s3)		#$t1 <- *A
	bne $t1,$s1,no_if	#(*A) != C -> no_if

	move $a0,$s2		#paràmetre 1 <- &B
	move $a1,$sp		#paràmetre 2 <- &cont

	jal comptar			#saltem a la funcio comptar

no_if:	

	addiu $s3,$s3,4		#++A
	addiu $s2,$s2,4		#++B
	addiu $s0,$s0,1		#++i
	
	b for 

fi_for:

	lw $v0,0($sp)		#return count
	
	lw $s0,4($sp)
	lw $s1,8($sp)		
	lw $s2,12($sp)		
	lw $s3,16($sp)
	lw $ra,20($sp)	
	addiu $sp,$sp,24

	jr $ra
	
comptar:

	lw $t0, 0($a1)		#(*num)
	addiu $t0,$t0,1		#++(*num)
	sw $t0,0($a1)		#&num <- ++(*num)

	li $t1,-1			#-1
	sw $t1,0($a0)		#&X <- -1

	jr $ra	
