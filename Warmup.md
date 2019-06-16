# Create an instance
  * in amazone market search for CentOS 7
  * enable termination policy - configure instance
  * two HDD - 8 + 4 both encrypted
  * select am existing security group http , 80 ssh
  * Launch
# Update instance
  * yum update
# format disk
  * fdisk -l - > check for disk name
  *  fdisk disk-name ( n,enter*)
# LVM
  * yum install lvm2
  * pvcreate disk-name
  * pvdisplay disk-name
  ### Volume Group create
    * vgcreate mystorage /dev/xvdb1
    * vgdisplay mystorage

  ### Lvm Create
    * lvcreate --name mylvm1 --size 3.9G mystorage
  ### format partition
    * mkfs.xfs /dev/mystorage/mylvm1
  ### Mounting
    * Need to mount on /home2
    * mkdir /home2
    * mount /dev/mystorage/mylvm1 /home2
    * put entry in fstab
      /dev/mystorage/mylvm1 /home2 xfs noexec
    * check if mounting is done properly
      mount -a
  # Disable Selinux
   nano /etc/selinux/config
   set SELINUX disabled
  # Set time zone to IST
    * cd /etc
    * ln -sf /usr/share/zoneinfo/Asia/Calcutta localtime
  # Install Basic Utility like netstat , wget vim , git
    * netstat already installed
    * yum install wget - > installs wget
    * yum install vim - > installs vim
    * yum install git - > installs git
  # Reboot Successfully !!!!!!!
  # Configure motd file
    * wget https://adhocnw.org/motd.txt
    * nano motd.txt
    * change Disk : 8G , Free Disk : 4G , Public IP, Private IP
    * nano .bash_profile
    * cat motd.txt
    * source .bash_profile
  ------
  # Apache
    * yum install httpd
    * systemctl start httpd.service
    * systemctl enable httpd.service
    ## SSL
      * yum install mod_ssl openssl
      * systemctl restart httpd.service
      * systemctl reload httpd.service
      * apachectl graceful
      * add port 443 https in inbound of security of your instance
  # PHP
    * yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    * yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
    * yum-config-manager --enable remi-php70
    * yum install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
    * php -v

## User Setup
  * change default home directory to /home2
    nano /etc/default/useradd
    HOME=/home2
  * useradd blu
  * mkdir /home2/public_html

## Virtual Host Configuration
  * cd /etc/httpd/conf.d
  * nano blu-php.conf
  ```
  <VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    ServerAdmin webmaster@example.com
    DocumentRoot /var/www/example.com/public_html

    <Directory /var/www/example.com/public_html>
        Options -Indexes +FollowSymLinks
        AllowOverride All
    </Directory>

    ErrorLog /var/log/httpd/example.com-error.log
    CustomLog /var/log/httpd/example.com-access.log combined
</VirtualHost>
```
  * nano /var/log/httpd/blu-adhocnw.com-error.log
  * nano /var/log/httpd/blu-adhocnw.com-access.log
  * https://linuxize.com/post/how-to-set-up-apache-virtual-hosts-on-centos-7/
  * apachectl configtest
  ```
  Syntax OK
  ```
  * systemctl restart httpd
  * changing DocumentRoot in ```/etc/httpd/conf/httpd.conf``` from
  /var/www/html to /home2/public_html and
  /var/www to /home2
  * now http://ip/page_in_public_html will be shown
  
