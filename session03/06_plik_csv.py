try:
  f=open("dane.csv","r",encoding="utf-8")
  dane = []
  sep = ';'
  # przeczytaj pierwszy wiersz (naglowki)
  # usun linie nowego wiersza
  head = f.readline().strip().split(sep)

  # dla kolejnych wierszy
  for w in f:
    dane.append(w.strip().split(';'))

  # sortowanie wg pola 3 (imie)
  dane2 = sorted(dane, key=lambda x: x[3])
  print(dane2)

  # wypisz imie studenta z wiersza 4
  print(dane[5][3])
  f.close()
except:
  print("problem!")

