# O maior de dois n�meros
# Este programa selecciona o maior de dois n�meros
# e coloca-o no registo $s7

	.data		# Data declaration section

	.text

main:					# Start of code section
		li $s0, 20			# primeiro n�mero
		li $s1, 14			# segundo n�mero
		bgt $s0, $s1, benfica   # salta para "benfica" se $s0>$s1
		move $s7, $s1 		# o maior � o $s1
		j FIM 			# Salta para o fim
benfica:	move $s7, $s0 		# o maior � o $s0
FIM: 

# END OF PROGRAM
