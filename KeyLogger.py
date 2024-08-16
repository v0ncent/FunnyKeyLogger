import keyboard


def on_key(event):
    print(event.name)


keyboard.hook(on_key)

keyboard.wait()

