# host.py

import time
import socket
import pydirectinput

HOST = "192.168.1.240"
PORT = 42069

queued = []
lastk = "a"

def callback(k):
	global queued
	global lastk

	if (k in ["ctrl", "shift", "alt"]):
		pydirectinput.keyDown(k)
		queued.append(k)
	else:
		pydirectinput.keyDown(k)

		for kh in queued:
			pydirectinput.keyUp(kh)
		queued = []
	return

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
	s.bind((HOST, PORT))
	s.listen()
	conn, addr = s.accept()
	with conn:
		print(f"Connected by {addr}")
		while True:
			data = conn.recv(1024)
			if data:
				k = data.decode()
				if (k != lastk):
					pydirecinput.keyUp(lastk)
				callback(k)
			else:
				pydirectinput.keyUp(lastk)
