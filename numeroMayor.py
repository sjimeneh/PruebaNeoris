# 2.	Elabore un algoritmo para leer 3 números, y determinar cuál es el mayor de estos tres.

def obtener_numero():
    while True:
        try:
            numero = float(input("Ingrese un número: "))
            return numero
        except ValueError:
            print("Por favor, ingrese un número válido.")

# Leer tres números desde el usuario
numero1 = obtener_numero()
numero2 = obtener_numero()
numero3 = obtener_numero()

# Determinar el mayor de los tres números
mayor = max(numero1, numero2, numero3)

# Mostrar el resultado
print("El mayor de los tres números es:", mayor)
