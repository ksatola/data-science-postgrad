# Pierwiastki rownania kwadratowego

from math import sqrt

while True:
    try:
        a = float(input("a="))
        # if a > 0: break
        b = float(input("b="))
        c = float(input("c="))
        break
    except:
        print("Nie podano poprawnie parametrow wejsciowych programu")

d = b*b - 4*a*c

if d >= 0:
    p = sqrt(d)
    x1 = (-b-p)/(2*a)
    x2 = (-b+p)/(2*a)
    print(x1, x2)
    print("x1=%0.2f"%x1) # niepolecany
    print("x1={:0.2f}, x2={}".format(x1, x2)) # lepiej
    print(f'x1a={x1:10.3f}') # najlepiej
    print("x2={1:0.2f}, x1={0}".format(x1, x2)) # lepiej
else:
    print("Brak pierwiastków")

