# wsrod 40 osob, jaka jest szansa, ze urodzily sie tego samego dnia i miesiaca?

# losujemy dzien w roku z puli 365(6) dni (dzien i miesiac)

from random import randint

# pojedynczy eksperyment

t = {} # do zliczania, ilosci wystepowania poszczegolnych dni
for i in range(1, 366): t[i] = 0 # <1, 366)

for i in range(40):
    # dzien roku
    dr = randint(1,365) # <1,365>
    t[dr] = t[dr]+1

ok = False
for i in range(1, 366):
    if t[i] > 1: ok = True

print(ok)
