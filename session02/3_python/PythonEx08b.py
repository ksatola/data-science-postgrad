# Jakie jest prawdopodobienstwo, ze wsrod 40 osob wylosujemy osoby,
# ktore sie urodzily tego samego dnia w roku?

from random import randint

licz = 0

for i in range(1000):

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

    if ok: licz+=1

# prawdopodobienstwo, ze conajmniej 2 urodzily sie tego samego dnia i miesiaca
print(licz/10, '%')

# wynik oscyluje w okolicach 90%
