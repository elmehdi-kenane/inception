FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /run/mysqld/

RUN rm -rf /run/mysqld/*

RUN chown -R mysql:root /var/run/mysqld


# CMD ["exec", "mysqld-safe"]
CMD ["mysqld", "--user=root", "--console"]