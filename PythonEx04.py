# Gra: za duzo, za malo

from random import randint

r = 10
x = randint(1,r)

while True:
    while True:
        try:
            y = int(input("Podaj liczbe calkowita z zakresu od 0 do {}, ktora mam na mysli: ".format(r)))
            break
        except:
            print("Nie podano liczby calkowitej.")

    if y > x: print("Za duzo")
    elif y < x: print("Za malo")
    else: break

print("Dobrze")
