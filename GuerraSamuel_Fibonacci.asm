.data
prompt: .asciiz "Introduce la cantidad de términos de Fibonacci: "
result: .asciiz "El resultado es: "
space:  .asciiz " "  # Espacio a añadir entre números

.text
main:
   # Pedir cantidad de términos
   li $v0, 4
   la $a0, prompt
   syscall

   li $v0, 5
   syscall
   move $t0, $v0  # Guardar la cantidad en $t0

   # Inicializar variables para Fibonacci
   li $t1, 0      # Primer término (F0)
   li $t2, 1      # Segundo término (F1)

   # Imprimir "El resultado es: "
   li $v0, 4
   la $a0, result
   syscall

   # Verificar si el número de términos es 0, en cuyo caso terminar
   beqz $t0, end_fib

   # Bucle para generar e imprimir la serie de Fibonacci
fib_loop:
   # Imprimir el término actual
   li $v0, 1
   move $a0, $t1
   syscall

   # Imprimir un espacio después del número
   li $v0, 4
   la $a0, space
   syscall

   # Decrementar el contador de términos restantes
   sub $t0, $t0, 1
   beqz $t0, end_fib  # Si el contador llega a 0, termina

   # Calcular el siguiente término
   add $t4, $t1, $t2  # $t4 = $t1 + $t2
   move $t1, $t2      # Actualizar $t1 para el siguiente ciclo
   move $t2, $t4      # Actualizar $t2 para el siguiente ciclo

   # Saltar al inicio del bucle
   j fib_loop

end_fib:
   # Salir
   li $v0, 10
   syscall
