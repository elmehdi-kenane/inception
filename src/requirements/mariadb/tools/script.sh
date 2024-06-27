#!/bin/bash

mysqld_safe &

until mysqladmin ping --silent; do
    echo "          Waiting for MariaDB to start..."
    sleep 1
done

echo "============== MariaDB is up and running. =============="

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE_NAME};"

mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USERNAME}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE_NAME}.* TO '${MYSQL_USERNAME}'@'%';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld_safe