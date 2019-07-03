#https://github.com/piyushagarwal08/Adhoc-NonCoder.git
# make volume LVM type
yum install lvm2 -y
pvcreate /dev/xvdb /dev/xvdc
vgcreate volumegroup1 /dev/xvdb
vgcreate volumegroup2  /dev/xvdc
lvcreate --name mylvm1 --size 3.9G volumegroup1
lvcreate --name mylvm2 --size 3.9G volumegroup2
mkfs.xfs /dev/volumegroup1/mylvm1
mkfs.xfs /dev/volumegroup2/mylvm2

# Mount disk 2 on /home2
mkdir /home2
mount /dev/volumegroup1/mylvm1 /home2

# Mount disk 3 on /var/lib/mysql
mkdir /var/lib/mysql
mount /dev/volumegroup2/mylvm2 /var/lib/mysql

# Entry in Fstab
cat <<EOF >> /etc/fstab
/dev/volumegroup1/mylvm1 /home2 xfs noexec
/dev/volumegroup2/mylvm2 /var/lib/mysql xfs noexec
EOF
umount /home2
umount /var/lib/mysql
mount -a

# disable selinux
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
setenforce 0

# Set timezone to IST
timedatectl set-timezone Asia/Kolkata

# MOTD file
# i will send the motd file using ansible or git
#mv motd.sh /etc/profile.d/

# update  everything
yum update -y

# Reboot server
#init 6

# Install Apache 2.4x with ssl and proxy module support
yum install httpd httpd.server -y
systemctl start httpd.service
systemctl enable httpd.service
yum install mod_ssl openssl -y

# Install php and all modules
yum install centos-release-scl -y
yum install rh-php70-php rh-php70-php-common rh-php70-php-cli rh-php70-php-devel rh-php70-php-gd rh-php70-php-json rh-php70-php-mbstring rh-php70-php-mysqlnd rh-php70-php-opcache rh-php70-php-zip -y

# setting up links
ln -s /opt/rh/httpd24/root/etc/httpd/conf.d/rh-php70-php.conf /etc/httpd/conf.d/
ln -s /opt/rh/httpd24/root/etc/httpd/conf.modules.d/15-rh-php70-php.conf /etc/httpd/conf.modules.d/
ln -s /opt/rh/httpd24/root/etc/httpd/modules/librh-php70-php7.so /etc/httpd/modules/
ln -s /opt/rh/rh-php70/root/usr/bin/php /usr/bin/php
php -v

# install MariaDB server
cat <<EOF > /etc/yum.repos.d/mariadb.repo
[mariadb]
name=MariaDB
baseurl=http://yum.mariadb.org/10.3/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

yum install MariaDB-server MariaDB-client -y
systemctl start mariadb
systemctl enable mariadb

#run mysql_secure_installation
#configure all information
#to run mysql
#mysql -u root -p
#password is secured non shareable redhat

# binding the mariadb server with loopback IP
sed -i 's/#bind-address=0.0.0.0/bind-address=127.0.0.1/g' /etc/my.cnf.d

# Increasing the max_allowed_packet to 1G
cat <<EOF >> /etc/my.cnf
[mysqldump]
max_allowed_packet=1G
EOF

# MYSQL REQUIREMENTS
# open mariadb using 'mysql -u root -p' (pass: redhat)
# CREATE DATABASE wp;
# CREATE DATABASE magento;
# USE wp;
# GRANT ALL PRIVILEGES ON *.* TO wp@localhost IDENTIFIED BY 'redhat';
# USE magento;
# GRANT ALL PRIVILEGES ON *.* TO magento@localhost IDENTIFIED BY 'redhat1';


#User Setup
useradd -b /home2 wp
useradd -b /home2 magento
mkdir /home2/magento/.ssh
touch /home2/magento/.ssh/authorized_keys
chmod 600 /home2/magento/.ssh/authorized_keys
chmod 700 /home2/magento/.ssh
mkdir /home2/wp/.ssh
touch /home2/wp/.ssh/authorized_keys
chmod 600 /home2/wp/.ssh/authorized_keys
chmod 700 /home2/wp/.ssh

#password less login
ssh-keygen -N "" -f /home2/magento/.ssh/key
cat /home2/magento/.ssh/key.pub >> /home2/magento/.ssh/authorized_keys

ssh-keygen -N "" -f /home2/wp/.ssh/key
cat /home2/wp/.ssh/key.pub >> /home2/wp/.ssh/authorized_keys

mkdir /home2/{wp,magento}/public_html

# change document root of magento and wp
cp /etc/httpd/conf/httpd.conf /home2/wp/
cp /etc/httpd/conf/httpd.conf /home2/magento/

# virtual host configuration of wp
cat <<EOF > /etc/httpd/conf.d/wp.conf
<VirtualHost *:80>
  ServerName piyushagarwal-wp.adhocnw.com
  DocumentRoot /home2/wp/public_html/
  <Directory /home2/wp/public_html/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order allow,deny
      allow from all
    Require all granted
  </Directory>
  ErrorLog /home2/wp/error.log
  CustomLog /home2/wp/access.log combined
</VirtualHost>
EOF

# virtual host configuration of magento
cat <<EOF > /etc/httpd/conf.d/magento.conf
<VirtualHost *:80>
  ServerName piyushagarwal-magento.adhocnw.com
  DocumentRoot /home2/magento/public_html/
  <Directory /home2/magento/public_html/>
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order allow,deny
      allow from all
    Require all granted
  </Directory>
  ErrorLog /home2/magento/error.log
  CustomLog /home2/magento/access.log combined
</VirtualHost>
EOF

# permissions for home and public_html
chmod 711 /home2
chmod 755 /home2/wp/public_html
chmod 755 /home2/magento/public_html

# Wordpress Setup
# download files
wget -P /tmp https://wordpress.org/latest.tar.gz
tar -xf /tmp/latest.tar.gz  -C  /home2/wp/public_html/
rm -rf  /tmp/latest.tar.gz
mv /home2/wp/public_html/wordpress/*   /home2/wp/public_html/
rm -rf  /home2/wp/public_html/wordpress/wget -P /tmp https://wordpress.org/latest.tar.gz
# install Wordpress
mv /home2/wp/public_html/wp-config-sample.php /home2/wp/public_html/wp-config.php
# enter database details 
# filled the details myself

# Magento Setup 
wget -P /tmp https://github.com/magento/magento2/archive/2.1.0.tar.gz
tar -xf /tmp/2.1.0.tar.gz -C /home2/magento/public_html/
mv /home2/magento/public_html/magento2-2.1.0/* /home2/magento/public_html/
mv /home2/magento/public_html/magento2-2.1.0/.htaccess /home2/magento/public_html/
rm -rf /home2/magento/public_html/magento2-2.1.0
