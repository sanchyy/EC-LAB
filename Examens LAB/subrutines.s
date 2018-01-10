.data

v1: 	.word 2,-3, 6, 2,-8, 5, 6, 2
v2: 	.word 0, 0, 0, 0, 0, 0, 0, 0
v3: 	.word 0, 0, 0, 0, 0, 0, 0, 0
res1:	.space 4
res2:	.space 4

.text
.glbl main
main: 
	addi $sp,$sp,-4 	#obrim pila
	sw $ra, 0($sp)		#guardem $ra, unic registre segur
	la $a0,v1			#carreguem adreça v1 a primer parametre
	la $a1,v2			#carreguem adreça v2 a segon parametre
	li $a2,2			#paràmetre 3 de la funcio = 2
	jal buscar			#saltem a la funcio
	la $t1,res1			#carreguem adreça de res1
	sw $v0,0($t1)		#guardem resultat funcio a res1
	la $a0,v1			#adreça v1 primer paràmetre
	la $a1,v3			#adreça v3 segon paràmetre
	li $a2,6			#tercer paràmentre = 6
	jal buscar			#saltem a la funcio buscar
	la $t2, res2		#carreguem adreça res2
	sw $v0, 0($t2)		#guardem resultat de la funcio a res2
	lw $ra, 0($sp)		#guardem $ra a $ra xd
	addiu $sp,$sp,4		#tanquem la pila
	
buscar:
	
	move $t0, $zero 	#i = 0
	li $t1, 8			#per la condicio <8

	move $s0,$a0		#guardem @ d'A a un segur
	move $s1,$a1		#guardem @ de B a un segur
	move $s2, $zero 	#cont = 0

	addiu $sp,$sp,-20 	#&A,&B,cont,$ra -> pila
	sw $s0,0($sp)		#&A -> pila
	sw $s1,4($sp)		#&B -> pila
	sw $s2,8($sp)		#cont -> pila
	sw $a2,12($sp)		#c -> pila
	sw $ra,16($sp)		#$ra -> pila

for:
	lw $t2, 0($a0)		#*A
	bne $t2,$a2,no_if	#(*A) != C -> no_if

	move $a0,$s1		#paràmetre 2 <- &B
	addu $a1,$sp,$t1 	#paràmetre 1 <- $sp+8 = &cont
	jal comptar			#saltem a la funcio comptar

no_if:	

	addiu $s0,$s0,1		#++A
	addiu $s1,$s1,1		#++B

	bltu $t0,$t1,for	#i < 8 -> for

	lw $s0,0($sp)		#$ra -> pila
	lw $s1,-4($sp)		#cont -> pila
	lw $s2,-8($sp)		#&B -> pila
	lw $a2,-12($sp)
	lw $ra,-16($sp)		#&A -> pila
	addiu $sp,$sp,+20	#&A,&B,cont,$ra -> pila

	move $v0, $s1		#retornem cont
	
comptar:

	lw $t1, 0($a2)		#(*num)
	addiu $t1,$t1,1		#++(*num)
	sw $t1,0($a2)		#&num <- ++(*num)

	lw $t2, 0($a1)		#*X
	addiu $t2,$t2,-1	#++(*X)
	sw $t2,0($a2)		#&X <- ++(*X)

	jr $ra	
