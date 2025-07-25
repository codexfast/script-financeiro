FROM php:5.4-apache

COPY . /var/www/html/

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/* # Clean up apt cache

RUN pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt
    
EXPOSE 80
