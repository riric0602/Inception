FROM alpine:3.18

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

EXPOSE 3306

COPY requirements/mariadb/conf/create_db.sh /usr/local/bin/create_db.sh
RUN chmod +x /usr/local/bin/create_db.sh

CMD ["create_db.sh"]

