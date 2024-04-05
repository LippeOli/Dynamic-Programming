# Função para verificar se um número é primo
def primeNumber(number, i):
    if number <= 1:
        return False
    else:
        if i * i > number:
            return True
        if number % i == 0:
            return False
        return primeNumber(number, i + 1)

# Função calcular o comprimento máximo entre dois primos consecutivos
def percorreList(x, y):
    maxDiff = 0
    lastPrime = None
    for number in range(x, y + 1):
        if primeNumber(number, 2):
            if lastPrime is not None:
                maxDiff = max(maxDiff, number - lastPrime)
            lastPrime = number
    return maxDiff

# Início do código
try:
    x = int(input())
    y = int(input())

    if x >= y:
        raise ValueError("O valor de x deve ser menor que y.")

    max_diff = percorreList(x, y)
    print(max_diff)
except ValueError as e:
    print("Erro:", e)
