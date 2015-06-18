.data
_v: .word 29,28,27,26,25,24,23,22,21,-1
_n: .word 10

.text
.globl main

main:
  la   $a0,_v  
  lw   $a1,_n 
  jal sort
  li  $v0,10      #Exit syscall
  syscall
  
# procedure sort 
sort:
  # preservao de registradores armazenando seus conte�dos na pilha
  addi $sp,$sp,-20 
  sw   $ra,16($sp) 
  sw   $s1,12($sp)  
  sw   $s0,8($sp)
  sw   $s2,4($sp)
  sw   $s3,0($sp)
  move $s2,$a0
  move $s3,$a1  
  move $s0,$zero   # inicializa��o de i
  # incio do corpo do lao externo
for1tst:
  nop #MARCA 1
  slt  $t0,$s0,$s3 # for1st
  beq  $t0,$zero,exit1  
  addi $s1,$s0,-1  
  # inicio do corpo do la�o interno
for2tst:
  slti $t0,$s1,0  # for2st
  bne  $t0,$zero,exit2 
  sll  $t1,$s1,2   
  add  $t2,$s2,$t1 
  lw   $t3,0($t2)
  lw   $t4,4($t2)
  slt  $t0,$t4,$t3
  beq  $t0,$zero,exit2

  move  $a1,  $s1
  nop # MARCA 2
  jal  swap 	# chamada de swap
  addi $s1,$s1,-1
  j    for2tst
  # fim do corpo do la�o interno
exit2:
  addi $s0,$s0,1
  j    for1tst
  # fim do corpo do la�o externo
exit1:
  # restaura��o de conte�dos de registradores preservados na pilha
  lw   $s0,0($sp)  
  lw   $s1,4($sp)
  lw   $ra,8($sp)
  lw   $s2,12($sp)
  lw   $s3,16($sp)
  addi $sp,$sp,20
  # retorno ao procedimento chamador 
  jr   $ra

 # codifica��o da procedure swap 
swap:
sll $t1,$a1,2
add $t1,$s2,$t1
lw $t0,0($t1)
lw $t2,4($t1)
sw $t2,0($t1)
sw $t0,4($t1)
jr $ra