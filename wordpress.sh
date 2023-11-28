#!/bin/bash

# Update dan upgrade paket
apt update && apt upgrade

# Instal Apache2
apt-get install apache2

# Instal MariaDB
apt install mariadb-server && mariadb-client

# Jalankan skrip keamanan MariaDB & phpmyadmin (manual)
apt-get install phpmyadmin
sudo mysql_secure_installation

# Instal PHP
apt-get install php && libapache2-mod-php && php-mysql


# Buat database WordPress
sudo mysql -u root -p << EOF
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EOF

# Unduh dan ekstrak WordPress (manual)
apt-get install unzip
cd /var/www/html
rm index.html
curl --remote-name --silent --show-error https://wordpress.org/latest.tar.gz
tar --extract --gzip --file latest.tar.gz
sudo mv wordpress/* .
rm latest.tar.gz
rmdir wordpress && rm latest.zip

# Ubah kepemilikan folder WordPress
chown -R www-data:www-data /var/www/html/

# Restart Apache2
systemctl restart apache2

# Informasi
echo "WordPress berhasil diinstal!"







