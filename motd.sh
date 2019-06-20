#!/bin/bash
# To get Processor Information
str=$(cat /proc/cpuinfo | head -n 5 | tail -n 1)
pro_info=${str#*:}

# To get Total Ram
#str=$(free -tm | head -n 2 | tail -n 1)
#total_ram=$(echo ${str#*:} | awk '{print $1}')
total_ram=$(cat /proc/meminfo | grep -w "MemTotal" | awk -F: '{print $2}')

# To get Total Swap
str=$(free -tm | head -n 3 | tail -n 1)
total_swap=$(echo ${str#*:} | awk '{print $1}')

# To get Total Disk Space
total_disk=$(df -h | head -n 2 | tail -n 1 | awk '{print $2}')

# To get Distro Details
str=$(cat /etc/os-release | head -n 1)
os_name=$(echo ${str#*=})
os_version="$(uname -r)"
distro="${os_name} with ${os_version}"

# To get CPU info
cpu1=$(mpstat | head -n 4 | tail -n 1 | awk '{print $5}')
cpu2=$(mpstat | head -n 4 | tail -n 1 | awk '{print $6}')
cpu3=$(mpstat | head -n 4 | tail -n 1 | awk '{print $7}')
cpu_load="${cpu1} ${cpu2} ${cpu3}"

# To get free Ram
str=$(free -tm | head -n 2 | tail -n 1)
free_ram=$(echo ${str#*:} | awk '{print $3}')

# To get free swap
str=$(free -tm | head -n 3 | tail -n 1)
free_swap=$(echo ${str#*:} | awk '{print $3}')

# To get free disk space
free_disk=$(df -h | head -n 2 | tail -n 1 | awk '{print $4}')

# To get Public and Private IP
public_ip=$(wget -qO- http://ipecho.net/plain | xargs echo)
private_ip=$(ifconfig eth0 | grep 'inet ' | awk '{print $2}')

# Now Organize all these in the proper format and display them
echo "###############################################################
#                 Authorized access only!                     #
# Disconnect IMMEDIATELY if you are not an authorized user!!! #
#         All actions Will be monitored and recorded          #
###############################################################
+++++++++++++++++++++++++++++++ SERVER INFO ++++++++++++++++++++++++++++++++
        CPU:"$pro_info
echo "  Memory: "$total_ram
echo "  Swap: "$total_swap
echo "  Disk: "$total_disk
echo "  Distro: "$distro
echo "  CPU Load: "$cpu_load
echo "  Free Memory: "$free_ram
echo "  Free Swap: "$free_swap
echo "  Free Disk: "$free_disk
echo "  Public Address: "$public_ip
echo "  Private Address: "$private_ip
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
