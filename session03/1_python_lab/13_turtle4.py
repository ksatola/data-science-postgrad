from turtle import *
import random

wn = Screen()
wn.bgcolor("lightgreen")      # Set the window background color
wn.title("Hello, Tess!")      # Set the window title

color("blue")            # Tell tess to change her color
pensize(1)               # Tell tess to set her pen width

while True:
    forward(20)
    #right(random.choice([-90, 0 , 90]))
    #right(random.choice([-120, 0 , 120]))
    right(random.choice([-60, 0 , 60, 30, -30]))

done()
