import sqlite3
import sys

db = sqlite3.connect('friends.db')
cursor = db.cursor()

def printFriends(name="", surname="", minAge=-1, maxAge=-1):
    sqlQuery = "SELECT * FROM friend WHERE name LIKE '%{}%' AND surname LIKE '%{}%'".format(name, surname)
    if minAge!=-1:
        sqlQuery += " AND age>='{}'".format(minAge)
    if (maxAge != -1):
        sqlQuery += " AND age<='{}'".format(maxAge)
    cursor.execute(sqlQuery)
    for row in cursor:
        print('[{}] {} {} - {} [age: {}]'.format(row[0], row[1], row[2], row[3], row[4]))

def insertFriend(name, surname, email, age):
    sqlQuery = "INSERT INTO friend (name, surname, email, age) VALUES ('{}', '{}', '{}', '{}')".format(name, surname, email, age)
    cursor.execute(sqlQuery)
    db.commit()

def deleteFriend(id):
    sqlQuery = "DELETE FROM friend WHERE id = '{}'".format(id)
    cursor.execute(sqlQuery)
    db.commit()

if len(sys.argv) == 1: exit()
command = sys.argv[1]

if command == "list":
    name = surname = ""
    min_age = -1
    max_age = -1
    if len(sys.argv)>=3: name = sys.argv[2]
    if len(sys.argv)>=4: surname = sys.argv[3]
    if len(sys.argv)>=5: min_age = sys.argv[4]
    if len(sys.argv)>=6: max_age = sys.argv[5]
    printFriends(name, surname, min_age, max_age)
elif command == "add":
    name = surname = email = ""
    age = 0
    if len(sys.argv)==2:
        print("Invalid syntax");
        exit()
    if len(sys.argv)>=3: name = sys.argv[2]
    if len(sys.argv)>=4: surname = sys.argv[3]
    if len(sys.argv)>=5: email = sys.argv[4]
    if len(sys.argv)>=6: age = sys.argv[5]
    insertFriend(name, surname, email, age)
    print("Friend added")
elif command == "delete":
    if len(sys.argv)<2:
        print("Invalid syntax");
        exit()
    id = sys.argv[2]
    deleteFriend(id)
    print("Friend deleted")

db.close()
