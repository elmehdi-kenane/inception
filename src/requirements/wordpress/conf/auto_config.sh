#!/bin/bash
# to make sure the MariaDB database has had time to launch correctly.
sleep 10

if [ ! -f "wp-config.php" ]; then
    wp config create --allow-root --path=/var/www/html
    # search about "--allow-root"
else
    echo "wp-config.php already exists. Skipping configuration."
fi