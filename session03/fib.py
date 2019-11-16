def fibi(n):
    a=b=1
    for i in range(1,n):
        c=a+b
        a=b
        b=c
    # end for
    return a
# end def

def fibr(n):
  if n<3: return 1
  else: return fibr(n-1)+fibr(n-2)
# end def


