from tkinter import *
from tkinter import messagebox

def clicked():
    print("click") 
    messagebox.showinfo('Message title', 'Message content')
# end def

 
window = Tk()
window.title("Welcome to LikeGeeks app")
window.geometry('350x200')

lbl = Label(window, text="Hello")
lbl.grid(column=0, row=0)

btn = Button(window, text="Click Me", command=clicked)
btn.grid(column=1, row=0)

window.mainloop()
