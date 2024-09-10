.data
prompt: .asciiz "Introduce un n�mero: "
msg_result: .asciiz "El mayor n�mero es: "

.text
main:
   # Pedir primer n�mero
   li $v0, 4
   la $a0, prompt
   syscall

   li $v0, 5
   syscall
   move $t0, $v0  # Guardar el primer n�mero en $t0

   # Pedir segundo n�mero
   li $v0, 4
   la $a0, prompt
   syscall

   li $v0, 5
   syscall
   move $t1, $v0  # Guardar el segundo n�mero en $t1

   # Pedir tercer n�mero
   li $v0, 4
   la $a0, prompt
   syscall

   li $v0, 5
   syscall
   move $t2, $v0  # Guardar el tercer n�mero en $t2

   # Comparar los n�meros
   move $t3, $t0  # Inicialmente asumimos que $t0 es el mayor

   bge $t1, $t3, update_t3_t1  # Si $t1 es mayor o igual a $t3 (mayor actual), actualizamos $t3
   bge $t2, $t3, update_t3_t2  # Si $t2 es mayor o igual a $t3, actualizamos $t3
   j print_result              # Saltar a imprimir el resultado si ya se encontr� el mayor

update_t3_t1:
   move $t3, $t1  # Actualizar $t3 con $t1 si $t1 es mayor o igual
   bge $t2, $t3, update_t3_t2  # Comparar $t2 con el nuevo mayor
   j print_result

update_t3_t2:
   move $t3, $t2  # Actualizar $t3 con $t2 si es el mayor

print_result:
   # Mostrar el mensaje
   li $v0, 4
   la $a0, msg_result
   syscall

   # Mostrar el mayor n�mero
   li $v0, 1
   move $a0, $t3
   syscall

   # Salir
   li $v0, 10
   syscall
