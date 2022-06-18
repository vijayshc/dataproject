FROM postgres:14.3
COPY ./init.sh /docker-entrypoint-initdb.d/
RUN chmod a+x /docker-entrypoint-initdb.d/init.sh
