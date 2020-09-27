FROM mysql:8

COPY createdb.sql /docker-entrypoint-initdb.d/

