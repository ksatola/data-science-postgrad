# Gra: za duzo, za malo (AI version) - komupter gra sam ze soba

from random import randint

r = 10
b = 1

x = randint(1,r)

while True:
    y = randint(1,r)
    print(y)

    if x == y:
        print("Wybrales: ", x)
        break

