import sys
import time

def wczytaj(nazwa):
  t = {}
  f=open(nazwa,"r")
  for w in range(0,9):
    line=f.readline()
    for k in range(0,9):
      t[w,k]=line[k]
    # end for
  # end for
  f.close()
  return t
# end def

def wypisz(t):
  for w in range(0,9):
    for k in range(0,9):
      print(' '+t[w,k],end='')
    # end for
    print()
  # end for
  print()
# end def

def puste(t):
  res = []
  for w in range(0,9):
    for k in range(0,9):
      if t[w,k]=='-':
        res.append((w,k))
      # end if
    # end for
  # end for
  return res
# end def

def mozliwe(t,w,k):
  res = "123456789"
  for i in range(0,9): res=res.replace(t[w,i],'') # usuwa juz wykorzystane w wierszu
  for i in range(0,9): res=res.replace(t[i,k],'') # usuwa z kolumny
  for i in range(k//3*3,k//3*3+3): # usuwa juz istniejace w kwadracie
    for j in range(w//3*3,w//3*3+3): res=res.replace(t[j,i],'')
  # end for
  return res
# end def

def ruch(t,lp,n):
  global lg
  if n==len(lp): # warunek konca
    wypisz(t)
    #time.sleep(0.5) # 1/2 sek. przerwy, 
    sys.exit() # zakonczyc caly program (import exit from sys)
  else:
    w,k = lp[n] # wiersz i kolumna z listy pustych
    for x in mozliwe(t,w,k):
      t[w,k]=x
      ruch(t,lp,n+1)
      t[w,k]='-' # algorytm z powrotami, jesli dead-end, to wstawiamy kreske
    # end for
  # end if
# end def


d=wczytaj("dane.txt")
wypisz(d) # wypisz dane
lp = puste(d) # ktore pola/wspolrzedne sa puste?
print(mozliwe(d, 0, 1)) # jakie sa mozliwe ruchy
#print(lp)
ruch(d,lp,0) # usupenia jedno pole z listy pustych


