#!/bin/bash

# Update and upgrade packages
apt update && apt upgrade

# Install Apache2
apt-get install apache2

# Install MariaDB
apt install mariadb-server mariadb-client

# Install PHP
apt-get install php libapache2-mod-php php-mysql

# Create WordPress database
mysql -u root -p << EOF
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EOF

# Download and extract WordPress
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz

# Move WordPress files to the correct location
sudo mv wordpress/* /var/www/html/

# Delete temporary files
rm -rf wordpress latest.tar.gz
rm /var/www/html/index.html

# Change ownership of WordPress files
sudo chown -R www-data:www-data /var/www/html/

# Secure MariaDB and install phpmyadmin
sudo mysql_secure_installation
apt-get install phpmyadmin

# Enable Apache2 modules
sudo a2enmod rewrite

# Restart Apache2
sudo systemctl restart apache2

# Information
echo "WordPress successfully installed!"
