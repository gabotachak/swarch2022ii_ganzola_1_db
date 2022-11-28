FROM mysql

ENV MYSQL_ROOT_PASSWORD password

WORKDIR /swarch2022ii_ganzola_1_db

ADD db.sql /docker-entrypoint-initdb.d

EXPOSE 3306
