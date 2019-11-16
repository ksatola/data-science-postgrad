# -*- coding: utf-8 -*-

import socket
import time

from pylab import *

################################################################################
    
def get_meteo():
  sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  sock.connect(('meteo2.ftj.agh.edu.pl',80))
  sock.send(b"GET /meteo/meteo.xml\n")
  s = sock.recv(1024).decode()
  sock.close()
  return s
# end def

################################################################################


if __name__ == '__main__':
  print("AGH meteo")

  l = []  
  while True:
    t = get_meteo()
    #print(t)
    # znajdz znacznik poczatkowy dla predkowsci wiatru <sx>
    p1=t.find("<sx>")
    # znajdz znacznik koncowy (po wartosci, ktora mnie interesuje)
    p2=t.find(" m/s")
    # pobierz 4 znaki miedzy p2 i p1
    v=float(t[p1+4:p2])
    l.append(v)
    print(l)
    plot(l)
    savefig("wykres.png")
    time.sleep(60)
  # end while
  
# end if

################################################################################

