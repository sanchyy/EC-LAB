	.data
result: .word 0
num:	.byte ';'

	.text
	.globl main
main:

# COPIA EL TEU CODI AQUI
	la $t0, num
	la $t2, result
	lb $t0, 0($t0)
	li $t1, 97 #97 = 'a'
	
	blt $t0, $t1, cond2
	addiu $t1, $t1, 25 #122 = 'z'
	ble $t0, $t1, llavors
cond2:	li $t1, 65 #65 = 'A'
	blt $t0, $t1, else1
	addiu $t1, $t1, 25 #90 = 'Z'
	bgt $t0, $t1, else1
	
llavors: sw $t0, 0($t2)
	j fi

else1:	li $t1, '0' #48 = '0'
	blt $t0, $t1, else2
	addiu $t1, $t1, 9 #57 = '9'
	bgt $t0, $t1, else2
	addiu $t0, $t0, -48
	sw $t0, 0($t2)
	j fi
	
else2:	li $t0, -1
	sw $t0, 0($t2)

fi:
	jr $ra

