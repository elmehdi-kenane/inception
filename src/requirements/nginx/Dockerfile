FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx -y && \
    mkdir -p /etc/nginx/ssl && \
    apt install openssl -y && \
    openssl req -x509 -noenc -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=./L=Casablanca/O=42/OU=42/CN=ekenane.42.fr/UID=ekenane" && \
    mkdir -p /var/run/nginx && \
    chmod 777 /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
