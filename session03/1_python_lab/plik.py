try:
  #f=open("text.txt","r",encoding="utf-8")
  f=open("tekst.txt","r",encoding="utf-8")
  for line in f:
    print(line)
  # end
  f.close()
except:
  print("problem!")
# end



