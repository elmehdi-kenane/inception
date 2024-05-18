#!/bin/bash

service mariadb start

# mysqld

sleep 5

mysql -e "CREATE DATABASE IF NOT EXISTS maria;"

mysql -e "CREATE USER IF NOT EXISTS 'aa'@'%' IDENTIFIED BY 'aa';"

# next line should be modifie to give privileges only to the maria database
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';"

mysqladmin -u root -p123 shutdown

exec mysqld_safe