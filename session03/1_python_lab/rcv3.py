from socket import * 
from string import * 

# Create socket and bind to address 
UDPSock = socket(AF_INET,SOCK_DGRAM) 
UDPSock.bind(('',1969)) 

# Receive messages 

while True: 
	data,addr = UDPSock.recvfrom(1969) 
	if not data: 
		print ("Program has exited!") 
		break 
	else: 
		print (data.decode('utf-8').ljust(50),addr[0] )

# Close socket 
UDPSock.close() 
