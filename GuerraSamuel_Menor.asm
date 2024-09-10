.data
prompt: .asciiz "Introduce un n�mero: "
msg_result: .asciiz "El menor n�mero es: "

.text
main:
   # Pedir primer n�mero
   li $v0, 4              # Syscall para imprimir cadena
   la $a0, prompt          # Cargar direcci�n del mensaje
   syscall

   li $v0, 5              # Syscall para leer entero
   syscall
   move $t0, $v0          # Guardar el primer n�mero en $t0

   # Pedir segundo n�mero
   li $v0, 4              # Syscall para imprimir cadena
   la $a0, prompt          # Cargar direcci�n del mensaje
   syscall

   li $v0, 5              # Syscall para leer entero
   syscall
   move $t1, $v0          # Guardar el segundo n�mero en $t1

   # Pedir tercer n�mero
   li $v0, 4              # Syscall para imprimir cadena
   la $a0, prompt          # Cargar direcci�n del mensaje
   syscall

   li $v0, 5              # Syscall para leer entero
   syscall
   move $t2, $v0          # Guardar el tercer n�mero en $t2

   # Comparar los n�meros para encontrar el menor
   move $t3, $t0          # Inicializar $t3 con el valor de $t0 (asumimos que es el menor)
   ble $t1, $t3, assign_t1 # Si $t1 es menor o igual a $t3, asignar $t1 a $t3
   ble $t2, $t3, assign_t2 # Si $t2 es menor o igual a $t3, asignar $t2 a $t3
   j print_result

assign_t1:
   move $t3, $t1           # Asignar $t1 a $t3 si $t1 es menor
   ble $t2, $t3, assign_t2 # Comparar ahora $t2 con $t3
   j print_result

assign_t2:
   move $t3, $t2           # Asignar $t2 a $t3 si es el menor

print_result:
   # Mostrar el mensaje "El menor n�mero es: "
   li $v0, 4
   la $a0, msg_result
   syscall

   # Mostrar el menor n�mero almacenado en $t3
   li $v0, 1
   move $a0, $t3
   syscall

   # Salir
   li $v0, 10
   syscall
