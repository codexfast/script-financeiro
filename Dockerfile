FROM php:7.4-apache

LABEL maintainer="seu-email@exemplo.com"

# Instala dependências
RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    gcc \
    g++ \
    make \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

# Instala extensões PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN pecl install mcrypt-1.0.4 && docker-php-ext-enable mcrypt

# Habilita rewrite e permissão para .htaccess
RUN a2enmod rewrite

# Copia arquivos do site
COPY . /var/www/html/

# Corrige permissões
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Permite .htaccess
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Expõe porta 80
EXPOSE 80

CMD ["apache2-foreground"]
