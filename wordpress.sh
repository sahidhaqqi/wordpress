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
sudo wget "https://wordpress.org/latest.zip"
unzip latest.zip
sudo mv wordpress/* .
rmdir wordpress && rm latest.zip

# Ubah kepemilikan folder WordPress
chown -R www-data:www-data /var/www/html/

# Restart Apache2
systemctl restart apache2

# Informasi
echo "WordPress berhasil diinstal!"








"
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Selamat Datang</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h1 class="text-center">Selamat Datang</h1>
        <p class="text-center">Oleh Sahid Haqqi An Najil</p>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>

</html> 
"
