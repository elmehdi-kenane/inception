#!/bin/bash
# to make sure the MariaDB database has had time to launch correctly.
sleep 10

cd /var/www/html
wp core download --allow-root

if [ ! -f "wp-config.php" ]; then
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
fi

wp config set DB_NAME $MYSQL_DATABASE_NAME --allow-root --path=$WP_DIR
wp config set DB_USER $MYSQL_USERNAME --allow-root --path=$WP_DIR
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root --path=$WP_DIR
wp config set DB_HOST $WP_DB_HOST --allow-root --path=$WP_DIR
# wp config set WP_DEBUG true --allow-root --path=$WP_DIR

# Create directory for sock-file
mkdir -p /run/php

wp core install --url=${WP_URL} --title="${WP_TITLE}" --admin_user=${WP_ADMIN_USERNAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

/usr/sbin/php-fpm7.4 -F