import sqlite3
import sys


db = sqlite3.connect('friends.db')
cursor = db.cursor()
#cursor.execute('SELECT * FROM friend')
#for row in cursor:
    #print('{0} {1} - {2} [age: {3}]'.format(row[1], row[2], row[3], row[4]))

def printFriends(name='', surname='', min_age=-1, max_age=-1):

    sqlQuery = "SELECT * FROM friend WHERE name LIKE '%{}%' AND surname LIKE '%{}%'".format(name, surname)
    if min_age != -1:
        sqlQuery += " AND age >='{}'".format(min_age)
    if max_age != -1:
        sqlQuery += " AND age <='{}'".format(max_age)

    cursor.execute(sqlQuery)
    for row in cursor:
        print('{0} {1} {2} - {3} [age: {4}]'.format(row[0], row[1], row[2], row[3], row[4]))

#print(10*'-')
#printFriends()
#printFriends("J") # w imieniu J
#printFriends("", "Wi") # w imieniu Jol i w nazwisku Wi
#printFriends("", "", 7) # wiek >= 7
#printFriends("", "", 7, 63) # wiek w przedziale od 7-63

def addRecord(name='', surname='', mail='', age=''):
    sqlQuery = "INSERT INTO friend (name, surname, email, age) VALUES ('{}', '{}', '{}', '{}')".format(name, surname, mail, age)
    cursor.execute(sqlQuery)
    db.commit() # zapis na stale do bazy

#print(10*'-')
#addRecord('Jan', 'Kowalski', 'jan.k@poczta', '20')
#print(10*'-')
#printFriends()


#UPDATE friend SET name ='John' WHERE name='James'
#DELETE FROM friend WHERE id='6'

def updateRecord(old_name='', old_surname='', name='', surname='', mail='', age=''):
    sqlQuery = '''
                UPDATE friend
                    SET name ='{}', 
                    surname = '{}',
                    email = '{}',
                    age = '{}'
                WHERE name LIKE '%{}%' AND surname LIKE '%{}%'
                '''.format(name, surname, mail, age, old_name, old_surname)
    cursor.execute(sqlQuery)
    db.commit()


#print(10*'-')
#printFriends()
#updateRecord('Jan', 'Kowalski', 'Jacek', 'Duda', 'mail@poczta', 21)
#printFriends()

def deleteRecord(id):
    sqlQuery = "DELETE FROM friend WHERE id='{}'".format(id)
    cursor.execute(sqlQuery)
    db.commit()

#deleteRecord(10)
#print(10*'-')
#printFriends()

if len(sys.argv) == 1: exit() # nie ma zadnych parametrow
command = sys.argv[1]

if command == 'list':
    # >python book_manager.py list J W 1 100
    printFriends(sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5])

elif command == 'add':
    # >python book_manager.py add name surname email age
    addRecord(name=sys.argv[2], surname=sys.argv[3], mail=sys.argv[4], age=sys.argv[5])

elif command == 'delete':
    # >python book_manager.py delete 13
    deleteRecord(id=sys.argv[2])

db.close()




