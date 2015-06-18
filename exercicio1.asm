.data
# Arranjo a ser ordenado:
_v: .word 29,28,27,26,25,24,23,22,21,-1
_k: .word 2
# Valor de k
.text
.globl main
main:
# Inicialização dos parâmetros:
la $a0,_v
lw $a1,_k
jal swap
li $v0,10      #Exit syscall
syscall
# corpo do procedimento
swap:
sll $t1,$a1,2
add $t1,$a0,$t1
lw $t0,0($t1)
lw $t2,4($t1)
sw $t2,0($t1)
sw $t0,4($t1)
# retorno ao programa principal 
jr $ra