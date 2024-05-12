import keyboard as kb

def callback(ke):
	print(f"{ke.name}")
	return

kb.on_press(callback)

while True:
	pass
