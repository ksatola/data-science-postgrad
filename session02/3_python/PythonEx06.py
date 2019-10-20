# Znajdz sume podzielnikow liczby - liczby doskonale
# Liczby doskonale, czy x jest rowny sumie swoich podzielnikow?

def sp(n, info=False):
    s=0 # suma podzielnikow
    # p - podzielnik liczby
    for p in range(1, n):
        # sprawdz, czy liczba p jest podzielnikiem liczby n
        if info: print("p: ", p)
        if n%p==0:
            s=s+p
            if info: print("sum: ", s)
    return s

import math

# ta funkja nie obsluguje poprawnie przypadkow,
# gdzie podzilnik jest rowny sqrt liczby
def sp2(n):
    s=1
    p=2
    while p <= math.sqrt(n): 
        if n%p == 0:
            s = s+p+n//p
        p=p+1
    return s


#sp(10)

for x in range(2, 100000):
    if x == sp2(x): print(x)
print("koniec")
