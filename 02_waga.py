def waga(li,n,p):
    if n==0: return True
    if p==len(li): return False # odwazniki sie skonczyly
    return waga(li,n-li[p],p+1) or waga(li,n,p+1)
# end def

# li - lista odwaznikow
# n - liczba (ciezar) do odwazenia
# p - argument dodatkowy, od ktorego odwaaznika zaczynamy (pozycja odwaznika)

odw = [1,3,5,10,16,24]

for i in range(1, 50):
    print(i, waga(odw, i, 0))


    
