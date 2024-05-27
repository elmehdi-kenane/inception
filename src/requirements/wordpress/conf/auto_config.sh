#!/bin/bash
# to make sure the MariaDB database has had time to launch correctly.
sleep 10

cd /var/www/html
wp core download --allow-root
# rm -rf /var/www/html/*

if [ ! -f "wp-config.php" ]; then
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
fi

wp config set DB_NAME maria --allow-root --path='/var/www/html'
wp config set DB_USER aa --allow-root --path='/var/www/html'
wp config set DB_PASSWORD aa --allow-root --path='/var/www/html'
wp config set DB_HOST mariadb --allow-root --path='/var/www/html'
# wp config set WP_DEBUG true --allow-root --path='/var/www/html'

# sed -i '23 s/database_name_here/maria/' /var/www/html/wp-config.php
# sed -i '26 s/username_here/aa/' /var/www/html/wp-config.php
# sed -i '29 s/password_here/aa/' /var/www/html/wp-config.php
# sed -i '32 s/localhost/maria:3306/' /var/www/html/wp-config.php
# sed -i '82 s/false/true/' /var/www/html/wp-config.php

# Create directory for sock-file
mkdir -p /run/php

wp core install --url="localhost" --title="My Wordpress Site" --admin_user="ekenane" --admin_password="123" --admin_email="appdevelopperpro@gmail.com" --allow-root

# if [ ! -f "wp-config.php" ]; then
#     # search about "--allow-root"
#     wp config create --allow-root --path=/var/www/html --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306
# else
#     echo "wp-config.php already exists. Skipping configuration."
# fi

/usr/sbin/php-fpm7.4 -F