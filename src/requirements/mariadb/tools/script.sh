#!/bin/bash

service mariadb start

# mysqld

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

mysql -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

# next line should be modifie to give privileges only to the maria database
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe