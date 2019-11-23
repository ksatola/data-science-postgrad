from openpyxl import Workbook
from datetime import date
from subprocess import call
import os

# -----------------
# Set up
# Retrieve current working directory (`cwd`)
cwd = os.getcwd()
cwd

# Change directory 
os.chdir("./exercises")


wb = Workbook()
ws = wb.active

# add set of rows
rows = [
    ['Lp.', 'Imię i nazwisko', 'Ala ma kota'],
    [date(2018,6,16), 40, 12],
    [date(2018,6,16), 40, 13],
]

for row in rows:
    ws.append(row)

output_file = './data/02-data-types.xlsx'
wb.save(output_file)

call(['open', output_file])
