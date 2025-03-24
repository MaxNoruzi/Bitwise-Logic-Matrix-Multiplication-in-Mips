.text
# matrix A[m][n] * B[m][k]

#load m to $s0
addi $v0 , $0, 5
syscall
addi $s0 , $v0 ,0
#load n to $s1
addi $v0 , $0, 5
syscall
addi $s1 , $v0 ,0

#load k to $2
addi $v0 , $0, 5
syscall
addi $s2 , $v0 ,0

li $t0,0 # counter
li $t1,0 # array size
li $t2,0
mult $s0 ,$s1
mflo $t1
getting_A: # getting array A
addi $v0 , $0, 5
syscall
addi $t2 ,$0,0
add $t2 ,$t0 ,$0 # $t2 is 4* counter and it shows us the pointer that we should use for saveing next elemnt
add $t2 ,$t0 ,$t2
add $t2 ,$t0 ,$t2
add $t2 ,$t0 ,$t2
sw $v0 , A($t2) # save the element
addi $t0 ,$t0 ,1 # i++
bne $t0,$t1,getting_A



li $t0,0
li $t1,0
li $t2,0
mult $s1 ,$s2
mflo $t1
getting_B:
addi $v0 , $0, 5
syscall
addi $t2 ,$0,0	# $t2 is 4* counter and it shows us the pointer that we should use for saveing next elemnt
add $t2 ,$t0 ,$0
add $t2 ,$t0 ,$t2
add $t2 ,$t0 ,$t2
add $t2 ,$t0 ,$t2
sw $v0 , A($t2)# save the element
addi $t0 ,$t0 ,1 # i++
bne $t0,$t1,getting_B#looping


li $s3 ,0# counter 1 =0  r
li $s4 ,0# counter 2 =0	  c	
li $s5 ,0# counter 3 =0  i
li $t0, 4#sizeof(Int)
li $t0,0
li $t1,0
li $t2,0
mult_loop:
  bge  $s3, $s0, mult_end   # if r >= m, branch
  li   $s4, 0               # c = 0

mult_loop2:
  bge  $s4, $s2, mult_end2  # if c >= k, branch
  li   $s6, 0               # int sum = 0;
  j    mult_loop3

mult_store:
  mul  $t3, $s3, $s2        # t3 = r * k
  mul  $t3, $t3, $t0        # t3 = t3 * 4
  mul  $t4, $s4, $t0        # t4 = c * 4
  add  $t3, $t3, $t4        # t3 = t3 * t4 = (r * k * 4) + (c * 4)
  sw   $s6, C($t3)          # C[r][c] = sum;

  addi $s4, $s4, 1          # c++
  li   $s5, 0               # i = 0
  j    mult_loop2

mult_loop3:
  bge  $s5, $s1, mult_store # if i >= n, branch
  # A[r][i]
  mul  $t5, $s3, $s1        # t5 = r * n
  mul  $t5, $t5, $t0        # t5 = t5 * 4
  mul  $t6, $s5, $t0        # t6 = i * 4
  add  $t5, $t5, $t6        # t5 = (r * n * 4) + (i * 4)
  lw   $t5, A($t5)

  # B[i][c]
  mul  $t7, $s5, $s2        # t7 = i * m
  mul  $t7, $t7, $t0        # t7 = t7 * 4
  mul  $t8, $s4, $t0        # t8 = 4 * c
  add  $t7, $t7, $t8        # t7 = (i * m * 4) + (c * 4)
  lw   $t7, B($t7)

  # mul  $t7, $t5, $t7        # t7 = t5 * t7
  mult $t5, $t7   
  mflo $t7
  add  $s6, $s6, $t7        # sum = sum + t7

  addi $s5, $s5, 1          # i++
  j    mult_loop3

mult_end2:
  addi $s3, $s3, 1          # r++
  j    mult_loop
mult_end:
li $t0,0 # counter
li $t1,0 # array size
li $t2,0 #
li $t3 ,0 # counter for printing space
mult $s0 ,$s2
mflo $t1
print_loop:
addi $v0 , $0, 1
addi $t2 ,$0,0
add $t2 ,$t0 ,$0 # $t2 is 4* counter and it shows us the pointer that we should use for saveing next elemnt
add $t2 ,$t0 ,$t2
add $t2 ,$t0 ,$t2
add $t2 ,$t0 ,$t2
lw $a0 ,C($t2) #load and show the element
syscall
#sw $v0 , A($t2) # save the element
addi $t0 ,$t0 ,1 # i++
addi $t3 ,$t3 ,1 # increasing space counter

addi $a0, $zero, 0x20		# 0x20 : space
addi $v0, $zero, 11
syscall
beq $t3,$s2 , print_nextLine
continue:
bne $t0,$t1,getting_A


print_nextLine:
addi $a0, $zero, 0x0A		# 0x0A : \n
addi $v0, $zero, 11
syscall
li $t3 ,0 # reseting next line counter
j continue
.data
A: .space 400 # ever element has 4 byte so we have 1 word for each element
B: .space 400	
C: .space 400
