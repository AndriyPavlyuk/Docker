FROM mysql:8

ENV MYSQL_DATABASE=discovery \
    MYSQL_USER=discovery \
    MYSQL_PASSWORD=discovery

COPY createdb.sql /docker-entrypoint-initdb.d/