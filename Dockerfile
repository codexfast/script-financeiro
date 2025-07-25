FROM php:5.4-apache

COPY . /var/www/html/
# Habilita extensões manualmente (se disponíveis)
RUN docker-php-ext-enable mysqli pdo pdo_mysql || true

EXPOSE 80
