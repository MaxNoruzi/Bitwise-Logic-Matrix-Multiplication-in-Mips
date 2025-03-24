.text
#load n to $s0
addi $v0 , $0, 5
syscall
addi $s0 , $v0 ,0
#$addi $v0,$0 , 1
#syscall
#load k to $s1
addi $v0 , $0, 5
syscall
addi $s1 , $v0 ,0

#load r to $2
addi $v0 , $0, 5
syscall
addi $s2 , $v0 ,0
add  $t0 , $0 , $0
beq  $s2 ,$0,rorate_To_Left
 loop1:
 beq  $0 , $s2 ,end # check for number of rotates
 srl $t1, $s0, 1   #shift original word 1 bit to the right
 sll $s0, $s0, 31  #shift original word 31 bits to the left
 or  $s0, $s0, $t1 #Combine two fragments of words and place result in source register
 addi $t0 ,$t0 ,1# increasing the counter
 j loop1 #looping
 
rorate_To_Left:
 loop2:
 beq  $t0 , $s2 ,end # check for number of rotates
 srl $t1, $s0, 31   #shift original word 31 bit to the right
 sll $s0, $s0, 1  #shift original word 1 bits to the left
 or  $s0, $s0, $t1 #Combine two fragments of words and place result in source register
 addi $t0 ,$t0 ,1# increasing the counter
 j loop2 #looping

end: