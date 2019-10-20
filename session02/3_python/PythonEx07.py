# Funkcja, ktora zwraca dzien tygodnia dla danej daty

# r z zakresu 1900-2099, bo warunek na rok przestepny jest bardziej skomplikowany
# m 0 - niedziela, 1 - poniedzialek, 2 - wtorek, 3 - sroda

def dt(r,m,d):

    # redukt miesiaca
    rm = (-1, 0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5)
    #         sty
    #            lut
    #               mar
    #                  kwi

    dt = d + rm[m] + (r-1900) + (r-1900)//4

    # rok przestepny
    if r%4==0 and m<3:
        dt=dt-1

    # 1 stycznia 1900 byl poniedzialek
    # 31.01 - sroda, bo 31%7 -> 3
    # 1.02 - poniedzialek, bo 1%7 -> 1 to byloby zle, wiec dla lutego w rm mamy dodaj 3 dla lutego

    return dt%7

#print(dt(1900,1,1))
#print(dt(2019,10,20))
#print(dt(1980,4,9))

# Sprawdz kiedy wypadaja piatki 13go
for r in range(2019,2050):
    for m in range(1, 13):
        if dt(r,m,13)==5:
            print(r,m,13)

# Kiedy miesiac bedzie mial 5 niedziel?
#    - jesli miesiac ma 31 dni i pierwsza niedziela wypada 1,2,3 dnia miesiaca
#    - jesli 30 to 1,2
#    - jesli 29 to 1 (przestepny luty)
