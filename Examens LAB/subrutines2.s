.data
#int fa_quelcom(char *p1, char *p2);
#int fa_quelcom2(int *p1, int *p2, int p3);
.globl main
.text
examen:
	#vl1 <- 10*1 = 10
	#vl2 <- 4*4 = 16

	addiu $sp,$sp,-46	#vl1,vl2,loc1,$ra
	#0-10 vl1 <- char
	#10-26 vl2 <- int
	sw $s0,26($sp)		#loc1
	sw $s1,30($sp)		#*i
	sw $s2,34($sp)		#*v
	sw $s3,38($sp)		#loc3
	sw $ra,42($sp)		#$ra

	move $a0, $sp
	#*p ja la tenim a $a1

	jal fa_quelcom 
	sw $v0,26($sp)		#guardem resultat a loc1

	addiu $a0,$sp,10	#guardem a $a0 &vl2
	addiu $a1,$sp,34	#guardem a $a1 *v
	move $a2,$v0

	jal fa_quelcom2
	move $t2, $v0		#loc2 -> $t2

	move $s3, $zero		#loc3 = 0
	move $t1, $zero		#loc4 = 0;
	li $t2, 4			#comparacio for
	move $t3,$zero		#stride
	addiu $t4,$sp,10	# @ de vl2

for:
	
	bge $t1,$t2,fi_for	#si loc4 >= 4 -> fi for
	lw $t5,0($t4)		#vl2[loc4]

	addu $s3,$s3,$t5	#loc3 += vl2[loc4]
	addiu $t4,$t4,4		#augmentar stride

	b for

fi_for:

	lw $t6,26($sp)		#*i
	div $s3,$t6			#loc3/loc1
	mflo $t6
	sw $t6,30($sp)		#*i = (loc3/loc1)

	sll $t2,$t2,2		#loc2*4
	addu $t2,$sp,$t2	
	lw $t2,10($t2)		#vl2[loc2]

	lw $v0,0($t2)		#vl1[vl2[loc2]]

