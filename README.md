# Tasks and Solutions
This file contains all the tasks and thier solutions given in the period of Adhoc Networks Summer Training Program 2019. Tasks are given on daily basis and they are related to Linux, AWS, Redhat, Docker etc.

# Day 1 (03/06/2019)
Notes for Day 1 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY%201.md) in detail.

## Task 1 Change the Monitor view from desktop to downloads for a particular user

*   There is a file called ```user-dirs.dirs``` in ```~/.config```
*   Edit the Desktop entry with Downloads

## Task 2 First Command Should Always give error
*   Pending

## Task 3 Concept of Recycle Bin why it is too fast to delete a file
*   When we delete a file it basically clears the entry of the file in inode table. Which means that the data of the file exist but it is not accessible without the inode table entry.

## Task 4 Create a 5GB file and copy it 3 Times, but take size only 1 time
*   Pending

## Task 5 What happened on Spetember 1752
*   The julian calender is 365.25 days long while the perfect Gregorian calender is precisely 365.24219 days long, which means that when the britishers adopted the gee.. calender they are 13 days ahead of the gee.. calender as such on September 03 1752 the britishers ommit 13 days from thier calender and since now we have these empty 13 days not showing in our system calender.
## Task 6 Create N number of Folders in Windows using loop
*   We can use windows bash scripting ```for``` loop for this task
```
for /l %i in (1,1,50) do mkdir dirname%i
```
*   Here ```%i``` is the counter variable and (1,1,50) means (Starting point, Increment size, End point)
* OR use python code using os module and for loop

## Task 7 Check at which location of RAM a variable takes memory and how much
*   it can be verified using Task manager in Windows and system monitor in linux
## Task 8 Create 500 variables and check its memory with comparison to null and a value
*   To do this I have used a liberary called ```memoryprofiler``` which gives a tabular output of each variable taking how much memory.
*   To run this program install a liberary from pip
```
pip install memory-profiler
```
*   Since this program contains annotations so we need to specify it while running the program
```
$ python -m memory_profiler example.py
```
*   Finally the program

```python
@profile
def my_func():
    a = [1] * (10 ** 6)
    b = [2] * (2 * 10 ** 7)
    del b
    return a

if __name__ == '__main__':
    my_func()
```
*   For more information about memory-profiler [visit](https://pypi.org/project/memory-profiler/)

# Day 2
Notes for Day 2 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY%202.md) in detail.
## Task 9 Display history with time in linux
* Run the below command in your terminal or paste this in ```.bashrc```
```
export HISTTIMEFORMAT='%F %T %t'
```

## Task 10 Update history by file in ```.bash_history``` without reboot or logout
*   Close all the terminal instances then edit the ```.bash_history``` file and then reopen it or use source.

## Task 11 Install VLC in windows without GUI interaction
```
vlc.exe /L=1033 /S  
```
*   ```/L``` parameter is for Language Selection and English Language is taken as 1033 according to bash scripting.
*   ```/S``` is for setup parameter
*   This will install your software without opening any GUI or such.
*   For more information about installing VLC [click here](https://wiki.videolan.org/Documentation:Installing_VLC/
)
* OR using pywinauto module, graphically install vlc

## Task 12 Find use cases of tuple in real life
*   Tuples are used for grouping data
*   Tuple assignment, Act as a return value
*   Composability of Data Structures
*   store location coordinates of some region
*   For more information [Click Here](http://openbookproject.net/thinkcs/python/english3e/tuples.html
)

# Day 3
Notes for Day 3 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY%203.md) in detail.
## Task 13 Application will not start with icons but will start with terminal
*   For completing this task we need a linux operating system with GUI.
*   So In order to this we need a package called ```alacarte``` which is freely available both in ```yum``` package manager and ```debian``` package managers.
*   You can install it by
```
yum install alacarte
apt-get install alacarte
```
*   By installing this package you will get a ```Main Menu``` named application in your application drawer.
*   Open that and choose the application you want to edit.
*   Then Double click that and edit the command path to something different.
*   This will modify the icon code by changing the actual path of the execution file.
*   Since now the application will not open from icon it will be opened by the terminal only until you fix that again.

## Task 14 How to write hello World in a directory
*   Pending

## Task 15 No of lines word characters count in python
*   To do this task you should have knowledge about file handling and string functions.

```py
filename = input("Please Enter a file name ")
myfile=open(filename)

lineCount = 0
wordCount = 0
charCount = 0
for lines in myfile:
    lineCount = lineCount + 1
    wordCount = wordCount + len(lines.split())
    charCount = charCount + len(lines)

print("No of Lines      :   ",lineCount)
print("No of Words      :   ",wordCount)
print("No of Characters :   ",charCount)
```

## Task 16 Count no of lines word character without saving data in a file
*   Run this program and this will ask user to enter input and to stop the input statement I have specified to use a word ```done``` to break the loop and give results.
*   Since this program will run on RAM there is no additional file write on hard disk or any other secondary storage.

```python
wordCount = 0
lineCount = 0
charCount = 0

print("Enter input \nType 'done' to end\n")

while True:
    line = input()
    if line=='done':
        break
    else:
        lineCount = lineCount + 1
        wordCount = wordCount + len(line.split())
        charCount = charCount + len(line)    

print("Number of lines      :   ",lineCount)
print("Number of Words      :   ",wordCount)
print("Number of Chars      :   ",charCount)
```

## Task 17 Search hello and then save top 5 URL in a list and then open top 5 url or all the search terms and then again save in a list and finally print that.

```python
from googlesearch import search
import time
web=input('pls enter topic:')

# now time for search
list1 = []
list2 = []
for i in search(web,stop=5):
	print(i) # i will only print the url
	time.sleep(1)
	list1.append(i)
print(list1)
for i in list1:
  for j in search(i,stop=5):
    list2.append(j)
print(list2)
```

# Day 4
Notes for Day 4 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY%204.md) in detail.
## Task 18 Connect RedHat with GUI
*   Pending

# Day 5
Notes for Day 5 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY5.md) in detail.
## Task 19 Write code in python to connect to SSH without putty
*   Pending

## Task 20 How to remove read and write permission from a file or directory for root or admin user
*   Pending

## Task 21 List how many people are in a group find that list
*   To find this there is a command called ```lid``` for this.
```
lid GROUPNAME
```
*  This will list all the users connected in the group, For more information click [here](https://www.cyberciti.biz/faq/linux-list-all-members-of-a-group/)

## Task 22 How to add multiple users in a group at once
*   For this I have developed a program for performing this task

```py
# usermod -G tech username
import subprocess
usernames = input("Enter names of users seperated with commas\n")
groupname = input("Enter group name ")
nameList = usernames.split(',')

for name in nameList:
    cmdString = "usermod -G "+groupname+" "+name
    print(cmdString)
    subprocess.getoutput(cmdString)
```
*   Enter the users name seperated by commas and then enter the group name and you are done.

# Day 6
Notes for Day 6 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY6.md) in detail.
## Task 23 Copy all RAM data to Secondary Storage and use that data
*   Pending

## Task 24 Find number of users connected in your wifi networks and show thier IP and MAC
*   Pending

## Task 25 Write a code that will create 100 files and 200 directories
* it can be done easily using os module like

```python
import os
for i in range(200):
  # creates 200 folders
  os.system("mkdir folder"+str(i))
for i in range(100):
  # creates 100 files  
  os.system("touch file"+str(i))
```

## Task 26 write a program to list number of users present in linux based os (RECHECK)
*   It can be done by using code
```python
import os
os.system('ls /home > users_list.txt')
print('Currently no of users in the system are: ')
os.system('wc -l users_list.txt')
```

## Task 27 Take 10 commands randomally from a user and check it of it is present then run it otherwise give voice based error message
```python
import os
import pyttsx3

def speak(x):
    tts = pyttsx3.init()
    rate = tts.getProperty('rate')
    tts.setProperty('rate',rate-10)
    volume = tts.getProperty('volume')
    tts.setProperty('volume',volume-1000)
    tts.say(x)
    tts.runAndWait()
for i in range(10):    
  command = input('Enter a command: ')
  os.system('command 2> error.txt')
  if (os.system('cat error.txt')):
    speak('Command not found')

```
## Task 28 Make tree directory architecture and provide different permissions
* we can create architecture using
```
$ mkdir A/B/D/I/L/H  A/B/E/H/K/M  A/C/F/H/K/M  A/C/G/J/K/M
```
* use chmod to provide permisions

## Task 29 Study about Web-Server
* Pending

# Day 7
Notes for Day 7 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY7.md) in detail

## Task 30 Make a camera working to connect with other OS
* Pending

## Task 31 Build a Qr code reader in python to scan the value and print it
*   Pending

## Task 32 Create a program that asks the user to enter their name and their age,Print out a message that will tell them the year that they will turn 95 years old.
```python
#!/usr/bin/python3
import time
name = input('Enter your name: ')
age = int(input('Enter your age: '))
years = 95 - age
print(f'{name} you will turn 95 in year',time.localtime().tm_year+years)          
```

## Task 33 write a code using  that will take user input from and search on google and store top 10 url in the list.
### conditions :
  ###  i )   URL must be stored permanently as well
  ###  ii)   user can give input using keyboard and  voice both
```python
#!/usr/bin/python3
from googlesearch import search
import time
web=input('pls enter topic:')

# now time for search
list1 = []
for i in search(web,stop=10):
	print(i) # i will only print the url
	time.sleep(1)
	list1.append(i)
print(list1)
f = open('url.txt','a+')
for i in list1:
	f.write(i+'\n')
f.close()
```

## Task 34 take a list say  adhoc=[1,2,3,1,4,5,66,22,2,6,0,9],write the program that will do  i)  print only those numbers greater than 5,ii)  also print those numbers those are less than or  equals to 2  ( <= 2 ), iii)  store these answers in in two different list also
```python
#!/usr/bin/python3
adhoc = [1,2,3,1,4,5,66,22,2,6,0,9]
five = [i for i in adhoc if i > 5]
two = [i for i in adhoc if i <= 2]
print('Numbers greater then 5')
for i in five:
	print(i)
print(five)
print('Numbers less than or equals to 2')
for i in two:
	print(i)
print(two)
```

## Task 35 ake all input from user . i)  check that all character are string, ii)  if all char are string then create user in your linux based OS, iii)  also create password for same user , password will, password will be  ===>>     hello{username}
```python
#!/usr/bin/python3
import os
import string
user_name = input('Enter user-name: ')
flag = 0
for i in list(user_name):
	if i not in string.ascii_letters:
		print('incorrect username')
		flag = 1
if flag == 0 :
	os.system(f'sudo useradd -p $(openssl passwd -1 hello+{user_name}) '+ user_name)
```

## Task 36 write a code  will take  input as your name and greet you with, good morning , good evening , goodafter noon , good night as per the current time your system :
```python
#!/usr/bin/python3
import time
name = input('Enter your name: ')
hr = time.localtime().tm_hour
min = time.localtime().tm_min

if hr>=12 and hr<17:
	print('Good Afternoon',name)
elif hr>=17 and hr<20:
	print('Good Evening',name)
elif hr>=20 and hr<24:
	print('Good Night',name)
else:
	print('Good Morning',name)
```
# DAY 9
Notes for Day 9 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY9.md) in detail

## Task 37 use file handling to create a linux command  similar to cat .test at least  4 cases and options of cat command, compare the difference of cat command and post the result
```python
#!/usr/bin/python3

print('''
1. to show contents of single file
2. to show contents of multiple file
3. insert using cat
4. display line numbers in file -n
''')
option = input('Select an option: ')
if option == '1':
	file_name = input('Enter file name: ')
	fhand = open(file_name)
	print(fhand.read())
	fhand.close()
elif option == '2':
	file_name = input('Enter file names: ').split()
	for i in file_name:
		fhand = open(i)
		print(fhand.read())
		fhand.close()
elif option == '3':
	file_name = input('Enter file name: ')
	fhand = open(file_name,'a')
	text = input('Enter what you want to write: ')
	fhand.write(text)
	fhand.close()
elif option == '4':
	file_name = input('Enter file name: ')
	fhand = open(file_name)
	text = fhand.readlines()
	for i in range(1,len(text)+1):
		print(i,text[i-1])
else:
	print('command not found')
```

## Task 38 use deep analysis of file handling to create a linux command similar to touch, explore atleast 5 features of touch command
* Pending

## Task 39 write a code that will take input from a user and check that if it is a command, then execute it with following  conditions : i)  all the commands given by user either wrong or right must be store in a file, ii)   output of success command will be shown to monitor,     iii)  if the input command is repeated by user give him voice note not to do this again
```python
#!/usr/bin/python3

import os
no_repeat = []
for i in range(3):

	command = input('Enter a command: ')
	if command in no_repeat:
		os.system("echo Don't Repeat the command again | festival --tts")
	else:
		no_repeat.append(command)
		os.system(command+' 2>error.txt')
		os.system(command+' &> command.txt')
	os.system('rm -r error.txt')
```

## Task 40 write a code that will take user input untill number of character not exceeding, 500 chars.Now do the following  tasks: i)   print the number of repeated characters in descending order, ii)  print number of repeated words in descending order, iii)  if a word is repeating more than 5 times remove all those words, iv)  if a word is present only one times add the same word in that string but length must not increase more than 500 chars , you can remove any random thing for doing the same .
```python
!/usr/bin/python3

from collections import Counter

text = input('Enter some text: ')
if len(text) > 500:
	text = text[0:500]

text_dict = dict(Counter(text))
print('No of repeated characters: ')
for i in sorted(text_dict,key=text_dict.get,reverse=True):
	print(i,text_dict[i])

word_dict = {}
word_text = text.split()
for i in word_text:
	if i in word_dict:
		word_dict[i] = word_dict[i] + 1
	else:
		word_dict[i] = 1
for i in sorted(word_dict,key=word_dict.get,reverse=True):
	print(i,word_dict[i])

for i in word_dict.keys():
	if word_dict[i] >5:
		texts = text.split()
		for j in range(word_dict[i]):
			text.remove(i)
		print(text)
	if word_dict[i] == 1:
		length = len(i)
		if len(text)+length > 500:
			text = text[0:500-length]
			text = text + ' ' + i
		else:
			text = text + ' ' + i
	print(text)

```
# DAY 10
Notes for Day 10 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY 10.md) in detail

## Task 41 Problem 10: write socket programing code in  a single system with follow options, i)  make two files one for sender and another one for receiver, ii) press 1 for sending / receiving  text messages from both the side, iii)  press 2  sending file from sender and receiving from receiver
 ### Receiver
 ```python
 #!/usr/bin/python2

 import socket
 re_ip="127.0.0.1"
 re_port=4484  # 0 - 1024 -- you can check free udp port : netstat -nulp

 # Creating UDP socket
 #		  ip type v4	   UDP
 s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

 # fitting ip and port with UDP socket
 s.bind((re_ip,re_port))
 print '1. text communication \n 2.file transfer'
 option = input('Choose an option: ')
 if option == 1:
 	print "To Close communication reply the sender with a blank message"
 	while(True):

 		# receiver data from sender
 		data=s.recvfrom(150)
 		print 'Server says: '+data[0]
 		text = raw_input('Client says: ')
 		if len(text) > 150:
 			print("Sorry, but message length exceeded")
 		else:
 			s.sendto(text,data[1])
 			if len(data[0]) == 0:
 				s.sendto('',data[1])
 				break

 	s.close()

 elif option == 2:
 	print "only sender can send file and close connection"
 	while(True):
 		# receive file from sender
 		file_name  =  raw_input("File name to save data: ")
 		data=s.recvfrom(10000)
 		if len(data[0]) == 0:
 			break
 		file = open(file_name,'a+')
 		file.write(data[0])


 	s.close()

 ```

 ### Sender
 ```python
 #!/usr/bin/python2

 import socket
 re_ip="127.0.0.1"
 re_port=4484  # 0 - 1024 -- you can check free udp port : netstat -nulp

 # Creating UDP socket
 #		  ip type v4	   UDP
 s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)


 print '1. text communication \n 2.file transfer'
 option = input('Choose an option: ')
 if option == 1:
     print "To close communication send an blank message"
     # Sending data to target
     while(True):
     	text = raw_input('Server says: ')
     	if len(text) > 150:
     		print("Message limit exceeded")
     	else:
     		s.sendto(text,(re_ip,re_port))
     		data = s.recvfrom(100)
     		if len(data[0]) == 0:
     			s.sendto('',(re_ip,re_port))
     			break
     		print 'Client says: '+data[0]
     		re_ip,re_port = data[1]
     s.close()
 elif option == 2:
     print "To close communication send an blank message"
     # Sending file to target
     while(True):
     	file_name = raw_input('Enter file name to send: ')
     	if len(file_name) == 0:
     		s.sendto('',(re_ip,re_port))
     		break
     	f = open(file_name)
     	s.sendto(f.read(),(re_ip,re_port))

     s.close()

 ```
## Task 42 write socket programing for chatting  between two systems with following options i)  sender only can start the message, ii)  receiver can send reply only of each message, iii) limit of message character length must not be exceed 150 characters ,iv)  if more than 150 char exceeded by users then print an error message, v)   give some option to quit the chat
 ### Reciever
```python
#!/usr/bin/python2

import socket
re_ip="127.0.0.1"
re_port=4484  # 0 - 1024 -- you can check free udp port : netstat -nulp

# Creating UDP socket
#		  ip type v4	   UDP
s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

# fitting ip and port with UDP socket
s.bind((re_ip,re_port))
print "To Close communication reply the sender with a blank message"
while(True):

	# receiver data from sender
	data=s.recvfrom(150)
	print 'Server says: '+data[0]
	text = raw_input('Client says: ')
	if len(text) > 150:
		print("Sorry, but message length exceeded")
	else:
		s.sendto(text,data[1])
		if len(data[0]) == 0:
			s.sendto('',data[1])
			break

s.close()
```
 ### sender
```python
!/usr/bin/python2

import socket
re_ip="127.0.0.1"
re_port=4484  # 0 - 1024 -- you can check free udp port : netstat -nulp

# Creating UDP socket
#		  ip type v4	   UDP
s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
print "To close communication send an blank message"
# Sending data to target
while(True):
	text = raw_input('Server says: ')
	if len(text) > 150:
		print("Message limit exceeded")
	else:
		s.sendto(text,(re_ip,re_port))
		data = s.recvfrom(100)
		print 'Client says: '+data[0]
		re_ip,re_port = data[1]
		if len(data[0]) == 0:
			s.sendto('',(re_ip,re_port))
			break
s.close()
```
# DAY 11
Notes for Day 11 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY 11.md) in detail


## Task 43 write a python code to do the following-> i)  take input from user and search in google, ii)   pick the first 3 url of google search, iii)  make  QR-code of all 3 url's, iv)   Store all these qr-code in  apache web server in aws cloud, v)   share link of qrcode using aws public IP
```python
!/usr/bin/python3
from googlesearch import search
import pyqrcode
import os
url = input('Enter text to search')
urllist = []
u = 0
for i in search(url,stop=3):
	urllist.append(i)
	print(i)

# Generate a QR
	qr = pyqrcode.create(i)
# create and save file
	qr.svg(f"qr{u}.svg",scale=2)
	print(qr.terminal())
	u = u+1
for i in range(3):
  os.system(f'mv qr{u}.svg /var/www/html')

# you can check for QR code by typing url http://my-instance-ip/qr0.svg
```

## Task 44 Do the following  settings in your redhat 7.5, i)  your system must not be able install a software telnet using yum, ii) your yum url have that telnet package it must not be install
  Solution
  ```
   $ sudo yum-config-manager --disable tel
  ```  
  This will permanently disable the 'tel' repo which contains the url for telnet package.

# DAY 12
Notes for Day 12 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY12.md) in detail

# DAY 13
Notes for Day 13 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY13.md) in detail

# DAY 14
Notes for Day 14 are mentioned [here](https://github.com/piyushagarwal08/Adhoc-ST-2019-/blob/master/DAY14.md) in detail

## Task 45 Create your own module with following options : i)   after  importing  it must say your name in voice, ii)   it must greet you according to current time, for example:  if it is morning 9 AM it must say  good morning,  iii)  it must offer for adding  numbers as per user need, iv)   it also offer sorting of numbers, v)    it can also print number of installed module
 ```python
 import pyttsx3
 import time
 import os

 def speak(x):
     tts = pyttsx3.init()
     tts.say(x)
     tts.runAndWait()
 speak('Welcome Pykid')

 def greet(x):
     if hour < 12:
         return 'good morning'
     elif hour < 16 and hour >= 12:
         return 'good afternoon'
     elif hour <20 and hour >= 16:
         return "good evening"
     else:
         return "good night"
 hour=time.localtime().tm_hour
 wish = greet(hour)
 speak(wish)
 print('''
 1. type add(4,5,3,6) to add any amount of numbers
 2. type sort_num(4,5,3,5,2,4) to sort list of numbers
 3. type module() to list installed modules
 ''')

 def add(*x):
     return sum(x)


 def sort_num(*x):
     return sorted(x)

 def module():
     os.system('pip3 list')
 ```

## Task 46 Adhocdocker1: i)   create your own docker image, ii)  it must use 80 port, iii)  host  a php  based sample web page, iv)   container must be running  on top of aws cloud
 * pending

## Task 47 take rows and column input from user and calculate how many rows and column combination are possible, factor of each number and find all possible array combination
 ```python
 #!/usr/bin/python3

 from itertools import product
 row =  int(input('Enter number of rows: '))
 column = int(input('Enter number of columns: '))

 def factor(x):
 	list1 = [i for i in range(1,x+1) if x % i == 0]
 	return list1
 print('All possible array combinations are: ')
 for i in product(factor(row),factor(column)):
 	print(i)

 ```

## Task 48 Generate 3x2 and 2x5  2D array with random element and save this data into two seperate files and print the data
 ```python
 import numpy as np

 a = np.random.random_integers(low=1,high=100,size=(3,2))
 b = np.random.random_integers(low=1,high=100,size=(2,5))
 np.savetxt('3x2.csv',a)
 np.savetxt('2x5.csv',b)
 print(a)
 print(b)
 ```

## Task 49 Revise numpy and matplotlib and revise requests module
 * done

## Task 50 create 2D numpy  based array with given conditions: i)   take input from user in terms of dimension like (3x2 or 6x7), ii)   fill this numpy array with random number, iii)  store this array in a file
 ```python
 import numpy as np
 row,column = input().split('x')
 array1 = np.random.random((int(row),int(column)))
 np.savetxt('array.txt',array1)
 y = np.loadtxt('array.txt')
 print(y)
 ```

## Task 51 create a numpy array of  8x2 as having number  in each cell between 100 and 200 such that difference between each element is 5
 ```python
 import numpy as np

 x = np.arange(100,200,5)
 x = x[0:16].reshape(8,2)
 print(x)
 ```

## Task 52 visualize data graphs i)  take input from  a file where you have 4 rows and 5 columns, ii)  columns having - student_name , marks , age , contact , study_hours, iii)  visualize this data as pie chart, iv)  file name must  student.csv with all column separated by ','
 ```python
 import pandas as pd
 import matplotlib.pyplot as plt

 data = {'student_name': ['Piyush','Saksham','Shivam','Akshay'],'marks':[76,89,96,99],'age':[20,20,21,21],'contact':['8749573948','3847563947','7480384729','9485736402'],'study_hours':[10,6,8,23]}

 student = pd.DataFrame(data,columns=['student_name','marks','age','contact','study_hours'])
 print(student)
 plt.pie(student['marks'],labels=student['student_name'])
 ```

## Task 53 Generate 3x2 and 2x5  2D array with random element and save this data into two seperate files and print the data
 ```python
 a = np.random.random_integers(low=1,high=100,size=(3,2))
 print(a)
 b = np.random.random_integers(low=1,high=100,size=(2,5))
 print(b)
 np.savetxt('3x2.csv',a)
 np.savetxt('2x5.csv',b)
 ```

## Task 54 plot  graphs given below in python3 with following data, i) calculate the internet speed from any web site you want, ii)  graph the result as guage graph, iii) it must move as per the speed changes
  * Pending

## Task 55 use this data from pandas, i) data source http://13.234.66.67/summer19/datasets/bank.csv ii) read this data by pandas iii) plot all the possible graphs iv) use all possible combination of all columns

```python
import pandas as pd
import matplotlib.pyplot as plt
read = pd.read_csv('http://13.234.66.67/summer19/datasets/bank.csv')
read.head(5)
plt.pie(read['CustomerId'].head(5),labels=read['CreditScore'].head(5),explode=[0.1,0.2,0.1,0.2,0.1],shadow=True)
plt.bar(read['Surname'].head(9),read['CreditScore'].head(9),label='Enjoy')
plt.scatter(read['Surname'].head(9),read['CreditScore'].head(9),label='Enjoy')
plt.plot(read['Surname'].head(9),read['CreditScore'].head(9),label='Enjoy')
plt.hist2d(read['Balance'].head(9),read['CreditScore'].head(9),label='Enjoy')
plt.hist(read['Surname'].head(9),label='Enjoy')
plt.stackplot(read['Surname'].head(10),read['CreditScore'].head(10),read['Balance'].head(10),color=['b'])
```

## Task 56 write the code will follow conditions, i) scrape data of the url https://en.wikipedia.org/wiki/Machine_learning ii) count all the words after scraping iii) plot the pie and bar plot of top 20 repeated words iv) plot scatter graph of all the words having presence more 3 times in scraped data v) show stack plot of all the links that are present in above URL

```python
import requests
from bs4 import BeautifulSoup
url =  'https://en.wikipedia.org/wiki/Machine_learning'
r = requests.get(url)
html = r.text
soup = BeautifulSoup(html, "html5lib")
text = soup.get_text().rstrip()
import nltk #natural language tool kit
token = nltk.RegexpTokenizer('\w+') #creating an object to found words by regex \w+
word_list = token.tokenize(text)   # list all words differently without any tags
word = nltk.FreqDist(word_list)     # does the work of Counter and makes a dictionary
nltk.FreqDist(word).plot(20)
from matplotlib import pyplot as plt
task = {}
for i in sorted(word,key=word.get,reverse=True):

  task[i] = word[i]
keys = []
values = []
for i,j in task.items():
  keys.append(i)
  values.append(j)
  if len(keys) == 20:
    break
# sorted the dictionary based on values and created two list of top 20 values
plt.pie(values,labels=keys)
```
## Task 57 Study that what is ID3 and CART and graphviz.
  * pending

## Task 58 Design a UI in Html asking a button upload.The file it will accept is JSON CSV or EXCEL, When upload completes it will show the data in form of tables using pandas.It will ask from a dropdown regarding which algorithm to use, It will then ask for testing data percentage again in options menu, If the classifier is KNN then it should ask for K value, After clicking submit it will show a graph plotting the data either on bar Scatter pie ask from user at that point or in previous page.
  * pending
  
