FROM php:5.6-apache

# Corrige repositório antigo e instala libmcrypt-dev + extensões
RUN sed -i 's|httpredir.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i '/security.debian.org/d' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y libmcrypt-dev && \
    docker-php-ext-install mcrypt mysqli pdo pdo_mysql

COPY . /var/www/html/

EXPOSE 80
