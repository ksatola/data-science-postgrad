# Jakie jest prawdopodobienstwo, ze wsrod 40 osob wylosujemy osoby,
# ktore sie urodzily tego samego dnia w roku?
# A jak zmienia sie to prawdopodobienstwo w zaleznosci od ilosci osob?

from random import randint

for k in range(20,50):

    licz = 0

    for i in range(1000):

        # pojedynczy eksperyment

        t = {} # do zliczania, ilosci wystepowania poszczegolnych dni
        for i in range(1, 366): t[i] = 0 # <1, 366)

        for i in range(k):
            # dzien roku
            dr = randint(1,365) # <1,365>
            t[dr] = t[dr]+1

        ok = False
        for i in range(1, 366):
            if t[i] > 1: ok = True

        if ok: licz+=1

    # prawdopodobienstwo, ze conajmniej k urodzily sie tego samego dnia i miesiaca
    print(k, licz/10, '%')

# zeby szanse byly wyrownane w zakladzie, k powinno byc w okolicach 23 lub 24 
