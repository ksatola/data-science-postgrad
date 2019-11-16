def waga(li,n,p,wynik):
    if n==0: print(wynik)
    if p==len(li): return 
    waga(li,n-li[p],p+1,wynik+[li[p]])
    waga(li,n+li[p],p+1,wynik+[-li[p]])
    waga(li,n,p+1,wynik)
# end def

odw = [1,2,5,10,16,24]

waga(odw,40,0,[])
