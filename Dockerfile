FROM php:5.4-apache

COPY . /var/www/html/
RUN docker-php-ext-install mysqli pdo pdo_mysql mcrypt
EXPOSE 80
