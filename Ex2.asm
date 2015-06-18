.data
_save: .word 99999,9,6,6,6,6,6,6,6,6,6
_k: .word 6
_error: .asciiz "Index Out of Bound Exception"
.text
.globl main
main: # inicialização
lw $s5,_k
addi $s3,$zero,0
la $s6,_save
lw $t2,4($s6)
addi $s6,$s6,8
Loop: # verificacao de limites do arranjo
sltu $t6,$s3,$t2
beq $t6,$zero,IndexOutOfBounds
# corpo do laço
sll $t1,$s3,2
add $t1, $t1, $s6
lw $t0, 0($t1)
bne $t0, $s5, Exit
addi $s3, $s3, 1
j Loop
Exit: # rotinas para imprimir inteiro
# ou mensagem de erro no console
addi $v0,$zero, 1
add $a0,$zero, $s3
syscall
J End
IndexOutOfBounds:
addi $v0,$zero, 4
la $a0,_error
syscall
End: