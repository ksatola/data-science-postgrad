try:
  #f=open("text.txt","r",encoding="utf-8")
  f=open("tekst.txt","r",encoding="utf-8")
  for line in f:

    # 1
    #print(line)

    # 2
    #print(line, end="")

    # 3
    #line = line.strip()
    #print(line)

    # 4
    # statystyka wystepowania znakow
    t = {} # do zliczania liter
    line = line.strip().lower() # bo S i s to ta sama litera
    for x in line:
      # jesli nie bylo klucza w slowniku,
      # zostanie on utworzony z wartoscia 0
      t.setdefault(x, 0) 
      t[x] = t[x]+1
    #print(t)

    # 5
    # lista par
    lp = t.items()
    #print(lp)

    # wyswietl parami
    #for k,w in lp: # k - klucz, w - wartosc
      #print(k,w)

    # sortowanie
    # lambda:
    # jezeli calosc jest x,
    # to chcemy sortowac po pierwszym elemencie x[0] calosci x
    lp2 = sorted(lp, key=lambda x: x[0], reverse=True) 
    for k,w in lp2: # k - klucz, w - wartosc
      print(k,w)
    
  # end
  f.close()
except:
  print("problem!")
# end



