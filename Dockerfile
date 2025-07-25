FROM php:5.6-apache

RUN apt-get update && \
    apt-get install -y libmcrypt-dev && \
    docker-php-ext-install mcrypt mysqli pdo pdo_mysql

COPY . /var/www/html/

EXPOSE 80
