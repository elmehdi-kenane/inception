FROM debian:bullseye

ENV SQL_DATABASE=maria
ENV SQL_USER=aa
ENV SQL_PASSWORD=aa
ENV SQL_ROOT_PASSWORD=123

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh ./script.sh

RUN chmod +x script.sh

CMD ["bash", "script.sh"]