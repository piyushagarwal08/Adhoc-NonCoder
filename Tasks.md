# DAY1

## TASK OF THE DAY~ :
  1. show files and folders of different folders other then desktop as default on monitor
     {open \home\adhoc\.config ~ > gedit user-dirs.dirs ~ > swap Desktop with Downloads ~ > Restart}
  2. First time run Command should always give some error
  3. Study Concept of Recycle Bin -- how it works
     {done, recycle bin keeps the metadata of files,and flags it to be deleted until user permanently deletes the file from          recycle bin}
  4. Make different copies of a >5MB file in a directory using only 5MB storage.
  5. why 3 to 13 dates are missing from september 1752 calendar?
    {To get the calendar back in sync with astronomical events like the vernal equinox or the winter solstice, 
    a number of days were dropped}
  6. Create 100 folders and delete them in Windows
    { use os module and make python code }
  7. Find the part of RAM where how much byte of data is actually stored or provided to a variable can be checked
    { it can be checked through system monitor in linux and task manager in windows }
  8. Make 500 variables and check change in size of RAM then replace variable's value with 'None' and re-check the RAM.
  
# DAY2
  
## TASK ~ :
  1. Find the date and time of a command from history list as to when it was used
     { set a variable HISTTIMEFORMAT = "%d/%m/%y %T ", save in .bashrc for permanent }
  2. Change/Update history manually at path(/home/adhoc/.bash_history) and show in terminal without logout/reboot
     { update history and just close the terminal, on reopening terminal changed history will be seen }
  3. What does 2> mean?
    { 2> inserts commands output in a file only if the command entered in incorrect else it displays the output and saves            nothing in file }
  4. Study/Read about Vulture and Firefly
  5. Read/Explore OSI Model 6
     { https://en.m.wikipedia.org/wiki/Presentation_layer }
  6. Install VLC player on windows using Python
    { use pywinauto module, run the code through cmd as administrator }
  7. Find various use-cases or tuple
     { 
       * Tuples are used to group together related data, such as a person’s name, their age, and their gender.
       * immutable objects can allow substantial optimization
       * Tuples can potentially be used as keys
       * Tuples can be used to store longitude and latitude coordinates
     }

# DAY3
## TASKS
  1. Run application from terminal but it should not run from icon(GUI)
    { alter the name of code-file in /usr/bin (firefox to firefoxs) and set alias in bashrc for firefox to firefoxs 
        (alias firefox='firefoxs') }
  2. How to Write Hello World in a Directory.
    { impossible, as a directory has no storage/memory of itself }
  3. Read about RAM
    { main memory,temporary, 2 types - SRAM nd DRAM, only data being used is stored }
  4. Find no. of lines in a file
    { file-handling in python, code saved in repo }
  5. Count no. of lines in a file without saving the file
    { input in terminal is saved in RAM, done, code i repo }
  6. open a browser-tab using python, find top 5 URLs and store them in list then open those 5 URLs and store top 5 in list         again
  7. Redirect message from terminal to whatsapp
  
# DAY4
## TASK
  1. WAP that runs different commands each after some delay
  2. Make user in windows using command line
  3. Make a new user and make it root then make sure new-user has no access to change root permissions from being admin
  4. More then 1 user to write in same file