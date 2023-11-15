#!/bin/bash

# Update the system
sudo apt-get update & upgrade

# Install Apache
sudo apt-get install apache2 -y

# install php
sudo apt-get install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

# Install PHP
sudo apt-get install php7.4 -y

# Install MariaDB
sudo apt-get install mariadb-server maridab-client -y

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

sudo apt-get install unzip

# Move WordPress to the web directory
sudo mv latest.zip /var/www/html
unzip latest.zip
rm index.html

# Change the ownership of the WordPress directory
sudo chown -R www-data:www-data /var/www/html/

# Enable WordPress rewrite rules
sudo a2enmod rewrite

# Restart Apache
sudo systemctl restart apache2

# Open a web browser and navigate to http://localhost
