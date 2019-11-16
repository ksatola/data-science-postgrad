from turtle import *

wn = Screen()
wn.bgcolor("lightgreen")      # Set the window background color
wn.title("Hello, Tess!")      # Set the window title

color("blue")            # Tell tess to change her color
pensize(1)               # Tell tess to set her pen width

x = 1
while True:
    forward(x)
    x = x + 1
    right(100)

done()
