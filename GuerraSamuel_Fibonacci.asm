.data
prompt: .asciiz "Introduce la cantidad de t�rminos de Fibonacci: "
result: .asciiz "El resultado es: "
space:  .asciiz " "  # Espacio a a�adir entre n�meros

.text
main:
   # Pedir cantidad de t�rminos
   li $v0, 4
   la $a0, prompt
   syscall

   li $v0, 5
   syscall
   move $t0, $v0  # Guardar la cantidad en $t0

   # Inicializar variables para Fibonacci
   li $t1, 0      # Primer t�rmino (F0)
   li $t2, 1      # Segundo t�rmino (F1)

   # Imprimir "El resultado es: "
   li $v0, 4
   la $a0, result
   syscall

   # Verificar si el n�mero de t�rminos es 0, en cuyo caso terminar
   beqz $t0, end_fib

   # Bucle para generar e imprimir la serie de Fibonacci
fib_loop:
   # Imprimir el t�rmino actual
   li $v0, 1
   move $a0, $t1
   syscall

   # Imprimir un espacio despu�s del n�mero
   li $v0, 4
   la $a0, space
   syscall

   # Decrementar el contador de t�rminos restantes
   sub $t0, $t0, 1
   beqz $t0, end_fib  # Si el contador llega a 0, termina

   # Calcular el siguiente t�rmino
   add $t4, $t1, $t2  # $t4 = $t1 + $t2
   move $t1, $t2      # Actualizar $t1 para el siguiente ciclo
   move $t2, $t4      # Actualizar $t2 para el siguiente ciclo

   # Saltar al inicio del bucle
   j fib_loop

end_fib:
   # Salir
   li $v0, 10
   syscall
