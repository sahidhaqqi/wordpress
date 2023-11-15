#!/bin/bash

# Update the system
sudo apt update -y 
sudo apt upgrade -y

# Install Apache
sudo apt install apache2 -y

# install php
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

# Install PHP
sudo apt install php7.4

# Install MariaDB
sudo apt install mariadb-server maridab-client -y

# Start Apache and MariaDB
sudo systemctl start apache2
sudo systemctl start mariadb

# Create a database for WordPress
sudo mysql -u root -p << EOF
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EOF

# Download WordPress
wget https://wordpress.org/latest.zip -y

apt install unzip

# Move WordPress to the web directory
sudo mv wordpress /var/www/html

# Change the ownership of the WordPress directory
sudo chown -R www-data:www-data /var/www/html/wordpress

# Enable WordPress rewrite rules
sudo a2enmod rewrite

# Restart Apache
sudo systemctl restart apache2

# Open a web browser and navigate to http://localhost
