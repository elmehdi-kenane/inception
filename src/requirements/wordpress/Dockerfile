FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt-get install -y wget && \
    apt-get install -y php && \
	apt-get install -y php-fpm && \
	apt-get install -y php-mysql && \
	apt-get install -y mariadb-client && \ 
    sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf && \
    # I think next line should be removed (I use [wp core download --allow-root] instead)
    mkdir -p /var/www/html && \
    chown -R root:root /var/www/html && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/auto_config.sh ./auto_config.sh

RUN chmod +x auto_config.sh

# ENTRYPOINT ["sleep", "infinity"]
ENTRYPOINT ["bash", "auto_config.sh"]



# sed -i '397 s/;//' /etc/php/7.3/fpm/pool.d/www.conf && \
# sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf &&