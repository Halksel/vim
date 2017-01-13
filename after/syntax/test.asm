
slt $t1,$s3, $s4
beq $t1,$zero, ELSE
add $s0,$s1, $s2
j L1
ELSE:
sub $s0,$s1,$s2

L1:
add $t1,$s0,$s0
add $t2,$s3,$s3
add $t2,$t2,$t2
  add $t2,$t2,$s5
sw $t1, 0($t2)

