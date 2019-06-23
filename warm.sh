# Server Version
cat /etc/os-release

# Disk Size or root and extra volume
fdisk -l

# memory info
cat /proc/meminfo | head -3

# Cpu info 
cat /proc/cpuinfo | head -10

# Updating Server Packages
yum update -y

#  Format disk LVM
yum install lvm2 -y
disk_name=$(fdisk -l | tail -4 | head -1 | awk -F: '{Print $1}' | awk '{print $2}'
pvcreate disk_name
vgcreate mystorage disk_name
lvcreate --name  mylvm1 --size 3.9G mystorage
mkfs.xfs /dev/mystorage/mylvm1

# Creating home2 directory  and mounting disk
mkdir /home2
mount /dev/mystorage/mylvm1 /home2

# Add entry in fstab
echo "/dev/mystorage/mylvm1 /home2  xfs  noexec" >> /etc/fstab

# disable selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
setenforce 0

#set time zone 
timedatectl  set-timezone  Asia/Kolkata

# Install basic utility
yum install netstat wget vim git -y

# MOTD FILE

# Install Apache with ssl
yum install httpd httpd.server -y
systemctl start httpd.service
systemctl enable httpd.service
yum install mod_ssl openssl -y

# Install PHP
yum install centos-release-scl -y
yum localinstall http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/l/libmcrypt-2.5.8-13.el7.x86_64.rpm -y

yum install rh-php70-php rh-php70-php-common rh-php70-php-cli rh-php70-php-devel rh-php70-php-gd rh-php70-php-json rh-php70-php-mbstring rh-php70-php-mysqlnd rh-php70-php-opcache rh-php70-php-zip sclo-php70-php-mcrypt rh-php70-php-xml rh-php70-php-intl -y

# Setting up PHP
ln -s /opt/rh/httpd24/root/etc/httpd/conf.d/rh-php70-php.conf /etc/httpd/conf.d/
ln -s /opt/rh/httpd24/root/etc/httpd/conf.modules.d/15-rh-php70-php.conf /etc/httpd/conf.modules.d/
ln -s /opt/rh/httpd24/root/etc/httpd/modules/librh-php70-php7.so /etc/httpd/modules/
ln -s /opt/rh/rh-php70/root/usr/bin/php /usr/bin/php

# Setting up MOTD file
chmod 777 motd.sh #move motd file to /etc/profile.d

# User Setup
useradd blu -d /home2
mkdir /home2/blu/public_html

# Virtual Host Configuration 
cat <<EOF > /etc/httpd/conf.d/blu-php.conf
<VirtualHost *:80>
  ServerName bluboy.adhocnw.com
  DocumentRoot /home2/blu/public_html/
  <Directory /home2/blu/public_html/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order allow,deny
      allow from all
    Require all granted
  </Directory>
  ErrorLog /var/log/httpd/blu-adhocnw.com-error.log
  CustomLog /var/log/httpd/blu-adhocnw.com-access.log combined
</VirtualHost>
EOF

# Setup error and access log files
cat <<EOF > /var/log/httpd/blu-adhocnw.com-error.log
	# creating an error log file for user blu
EOF
cat <<EOF > /var/log/httpd/blu-adhocnw.com-access.log
	# creating an access log file for blu
EOF

# checking apache configuration
apachectl sysconfig

# Setting php info page
cat <<EOF > /home2/blu/public_html/phpinfo.php
<?php
phpinfo();
?>
EOF

# Editing /hosts file
echo "127.0.0.1 bluboy.adhocnw.com" >> /etc/hosts

#Updating all Packages
yum update -y



