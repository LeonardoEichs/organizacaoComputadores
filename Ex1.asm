.data
_save: .word 6,6,6,6,6,6,6,6,6
_k: .word 6
.text
.globl main
main: # inicialização
addi $s3,$zero,0
lw $s5,_k
la $s6,_save
j Loop
Loop: # corpo do laço
sll $t1,$s3,2
add $t1, $t1, $s6
lw $t0, 0($t1)
bne $t0, $s5, Exit
addi $s3, $s3, 1
j Loop
Exit:
# rotina para imprimir inteiro no console
addi $v0,$zero, 1
add $a0,$zero, $s3
syscall