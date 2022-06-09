FROM node:18 AS BASE

RUN apt-get update

WORKDIR /var/www
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]