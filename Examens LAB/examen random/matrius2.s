
.data

A:	.word 1, 11, 12, 13
	.word 2, -3, 14, 15
	.word 4, -5,  6, 16
	.word-7,  8, -9, 10

.globl main
.text

main:

	move $t0, $zero		#i = 0
	li $t1, 4			#per fer < 4
for_i:

	bge $t0,$t1,fi_for_i
	move $t2,$zero		#j = 0
	la $t3, A			#A[0][0]
	sll $t5,$t0,2
	addu $t4,$t3,$t5	#A[0][i]
	sll $t5,$t5,2
	addu $t3,$t5,$t4	#A[i][0]

for_j:
	
	bge $t2,$t0,fi_for_j


if_j:
	
	lw $t5,0($t3)
	bleu $t5,$zero,else_j
	sw $t5,0($t4)
	b fi_else_o_if

else_j:
	
	sw $zero,0($t5)

fi_else_o_if:

	addiu $t3,$t3,4		#A[i][j] (augmenta j)
	addiu $t4,$t4,16	#A[j][i] (augmenta j)
	b for_j
	
fi_for_j:
	
	b for_i

fi_for_i:

	jr $ra


	








