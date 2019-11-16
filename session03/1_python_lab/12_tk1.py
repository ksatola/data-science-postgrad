from tkinter import *
from tkinter import messagebox

def clicked():
    print("click") 
    messagebox.showinfo('Message title', 'Message content')
# end def

 
window = Tk()
window.title("Welcome to LikeGeeks app")
window.geometry('350x200')

# label - tekst w okienku
lbl = Label(window, text="Hello")
lbl.grid(column=0, row=0)

# button - przycisk w okienku
btn = Button(window, text="Click Me", command=clicked)
btn.grid(column=1, row=0)

window.mainloop()
