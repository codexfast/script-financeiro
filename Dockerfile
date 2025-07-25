FROM php:5.4-apache

COPY . /var/www/html/
 RUN pecl install mcrypt-1.0.4 && \
        docker-php-ext-enable mcrypt
RUN docker-php-ext-install mysqli pdo pdo_mysql
EXPOSE 80
