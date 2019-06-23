echo "
###############################################################
#                 Authorized access only!                     # 
# Disconnect IMMEDIATELY if you are not an authorized user!!! #
#         All actions Will be monitored and recorded          #
###############################################################
"
echo "+++++++++++++++++++++++++++++++ SERVER INFO ++++++++++++++++++++++++++++++++
"
cpu=$(cat /proc/cpuinfo | head -5 | tail -1 |awk -F: '{print $2}')
mem=$(cat /proc/meminfo | grep "MemTotal" | awk -F: '{print $2}')
swap=$(cat /proc/meminfo | grep "SwapTotal" | awk -F: '{print $2}')
disk=$(df -h | head -4 | tail -1 |awk '{print $2}')
distro=$(cat /proc/version_signature)
free_mem=$(cat /proc/meminfo | head -2 | tail -1|awk -F: '{print $2}')
free_swap=$(cat /proc/meminfo | grep "SwapFree" |awk -F : '{print $2}')
free_disk=$(df -h|head -4 | tail -1|awk '{print $4}')
public_ip=$(echo "172.12.23.124")
private_ip=$(echo "182.23.23.56")

echo "		CPU:" $cpu
echo "		Memomory:" $mem
echo " 		Swap:" $swap
echo "		Disk:" $disk
echo "		Distro:" $distro
echo "		Free Memory:" $free_mem
echo "		Free Swap:" $free_swap
echo "		Free Disk:" $free_disk
echo "		Public Address:" $public_ip
echo "		Private Address:" $private_ip

echo "
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"

