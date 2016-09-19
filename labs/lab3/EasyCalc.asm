#Dan Bonnett
#CMPSCI 210 Lab3 Part 1
#Due Date: 9/21/2015
#Honor Code: The work I am submitting is mine unless otherwise cited
#Performing the calculation: x = a - (2*b + c - d)

	.data

	.align  2

a:	.word  10   # 4 bytes of memory containing the integer 10
b:	.word  20   # 4 bytes of memory containing the integer 20
c:	.word  -30  # 4 bytes of memory containing the integer -30
d:	.word  -40  # 4 bytes of memory containing the integer -40

x:	.space  4   # 4 bytes of memory

	.text
	
	lw  $t0, b  # load contents of memory address b into $t0
	add $t0, $t0,$t0  # $t0 = 20 + 20
	lw  $t1, c  #load contents of memory address c into $t1
	add $t0, $t0,$t1  # $t0 = 40 + -30
	lw  $t1, d   # load contents of memory address d into $t1
	sub $t0, $t0, $t1  # $t0 = 10 - -40
	lw  $t1, a  # load contents of memory address a into $t1
	sub $t0, $t1, $t0   # $t0 = 10 - 50
	sw  $t0, x   #store the result in x
