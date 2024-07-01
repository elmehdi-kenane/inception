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

if ! wp core is-installed --allow-root; then
    wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USERNAME} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root
else
    echo "WordPress is already installed."
fi

user_exists=$(wp user list --role=${WP_USER_ROLE} --field=user_login --allow-root | grep ${WP_USER_FIRSTNAME})

if [ -z "$user_exists" ]; then
    wp user create ${WP_USER_FIRSTNAME} ${WP_USER_EMAIL} --role=${WP_USER_ROLE} --user_pass=${WP_USER_PASSWORD} --display_name=${WP_USER_FIRSTNAME} --user_nicename=${WP_USER_FIRSTNAME} --nickname=${WP_USER_FIRSTNAME} --first_name=${WP_USER_FIRSTNAME} --last_name=${WP_USER_LASTNAME}  --allow-root
else
    echo "User with nickname "${WP_USER_FIRSTNAME}" already exists."
fi

/usr/sbin/php-fpm7.4 -F