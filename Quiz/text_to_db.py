#!/usr/bin/python3.7
import mysql.connector as mysql

# DataBase information
username = ''
password = ''
database_name = ''
host = ''

# Now connecting the Database
conn = mysql.connect(user=username,password=password,database=database,host-host)

# now generating a SQL language cursor
cur = conn.cursor()

# will be using file name and table name same for easy access of data
file_name = input('enter file to insert data without extension')
with open('file_name'+'.txt','r') as file:
    data = file.readlines()
    for i in data:
        text = i.split('::')
        cur.execute(f'insert into {file_name} values({text[0]},{text[1]},{text[2]},{text[3]},{text[4]})')

# saving all inserted data
cur.commit()

# closing the connection with database
print('All Questions updated Successfully')
conn.close()

#
