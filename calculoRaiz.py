#En lenguaje de seudocódigo (cercano a Python) 
#Elabore un algoritmo que calcule la raíz cuadrada de un número con un error del 0.01 sin usar funciones matemáticas.


# Ingresar el número a calcular
try:
    numero_a_calcular = float(input("Ingrese el número para calcular su raíz cuadrada: "))
except ValueError:
    print("Error: Ingrese un número válido.")
    exit()

# Validar que el número sea no negativo
if numero_a_calcular < 0:
    print("Error: Ingrese un número no negativo para calcular la raíz cuadrada.")
    exit()

# Inicializar la aproximación inicial
aproximacion = numero_a_calcular / 2.0

# Especificar el nivel de error
error = 0.01

# Iterar hasta que la aproximación sea lo <= al error y asurando el valor absoluto
while abs(aproximacion**2 - numero_a_calcular) > error:
    aproximacion = 0.5 * (aproximacion + numero_a_calcular / aproximacion)

# Mostrar el resultado y redondear el valor a 4 decimales
print(f"La raíz cuadrada de {numero_a_calcular} es aproximadamente {round(aproximacion,4)}")