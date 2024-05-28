#!/bin/bash

# echo "============== mysqld_safe & output =============="
mysqld_safe &
# echo "============== ==================== =============="
# service mariadb start

sleep 5

if [ -d "/var/lib/mysql/maria" ]
then 
	echo "++++++++++++++++++++ maria Directory exists ++++++++++++++++++++"
else
	echo "-------------------- maria Directory does not exists --------------------"
fi

if [ -d "/var/lib/mysql" ]
then 
	echo "++++++++++++++++++++ mysql Directory exists ++++++++++++++++++++"
else
	echo "-------------------- mmysql Directory does not exists --------------------"
fi

if [ -d "/var/lib/mysql/mysql" ]
then 
	echo "++++++++++++++++++++ mysql/mysql Directory exists ++++++++++++++++++++"
else
	echo "-------------------- mysql/mysql Directory does not exists --------------------"
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    sleep 5
fi

until mysqladmin ping --silent; do
    echo "============== Waiting for MariaDB to start... =============="
    sleep 1
done

echo "============== MariaDB is up and running. =============="

mysql -e "CREATE DATABASE IF NOT EXISTS maria;"

mysql -e "CREATE USER IF NOT EXISTS 'aa'@'%' IDENTIFIED BY 'aa';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'aa'@'%';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p"123" shutdown

exec mysqld_safe
