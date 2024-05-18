#!/bin/bash
# to make sure the MariaDB database has had time to launch correctly.
sleep 10

cd /var/www/html
wp core download --allow-root

# replace sed command with wp config set 
sed -i '23 s/database_name_here/maria/' /var/www/html/wp-config-sample.php
sed -i '26 s/username_here/aa/' /var/www/html/wp-config-sample.php
sed -i '29 s/password_here/aa/' /var/www/html/wp-config-sample.php
sed -i '32 s/localhost/db-service:3306/' /var/www/html/wp-config-sample.php
sed -i '82 s/false/true/' /var/www/html/wp-config-sample.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
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
# /usr/sbin/php-fpm7.4