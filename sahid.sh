#!/bin/bash

# Update dan upgrade paket
apt update && apt upgrade

# Instal Apache2
apt install apache2

# Instal MariaDB
apt install mariadb-server mariadb-client

# Jalankan skrip keamanan MariaDB
sudo mysql_secure_installation

# Instal PHP
apt install php libapache2-mod-php php-mysql

# Instal PHPMyAdmin
apt install phpmyadmin

# Buat database WordPress
sudo mysql
CREATE DATABASE sahid;
GRANT ALL PRIVILEGES ON SAHID.* TO root@localhost IDENTIFIED BY"admin";
FLUSH PRIVILEGES;
EXIT;

# Unduh dan ekstrak WordPress
apt install unzip
cd /var/www/html/
rm index.html
sudo wget https://wordpress.org/latest.zip
unzip latest.zip
sudo mv wordpress/* .
rmdir wordpress && rm latest.zip

# Ubah kepemilikan folder WordPress
chown -R www-data:www-data /var/www/html/

# Restart Apache2
systemctl restart apache2

# Informasi
echo "WordPress berhasil diinstal!"