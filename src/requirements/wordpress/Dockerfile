FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install -y wget && \
    apt-get install -y php7.3 && \
	apt-get install -y php-fpm && \
	apt-get install -y php-mysql && \
	apt-get install -y mariadb-client && \
    wget https://wordpress.org/latest.tar.gz -P /var/www && \
    cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz && \
    cd /var/www/ && mkdir -p /var/www/html && mv /var/www/wordpress/* /var/www/html && \
    rm -rf /var/www/wordpress && \
    chown -R root:root /var/www/html && \
    # sed -i '397 s/;//' /etc/php/7.3/fpm/pool.d/www.conf && \
    # sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/auto_config.sh ./auto_config.sh

RUN chmod +x ./auto_config.sh

ENTRYPOINT ["sleep", "infinity"]