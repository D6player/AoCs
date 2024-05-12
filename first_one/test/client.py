# client.py

import socket
import keyboard

HOST = "192.168.1.240"
PORT = 42069

CD = 0

def callback(ke, s):
	global CD

	if (CD <= 0):
		s.sendall(ke.name.encode())
		CD = 750000

	return

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
	s.connect((HOST, PORT))
	keyboard.on_press((lambda ke: callback(ke, s)))
	while True:
		if (CD > 0):
			CD -= 1
		pass
