import socket 

def snd(data):
  s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
  s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
  s.sendto(data.encode('utf-8'), ('255.255.255.255', 1969)) 
  s.close()
# end def 

# Send messages 

while (True):
  data = input('>>')
  if not data:
    break
  else:
    snd(data)
  # end if 
# end while 
