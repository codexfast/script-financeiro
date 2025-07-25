# Imagem oficial PHP 7.4 com Apache
FROM php:7.4-apache

# Copia os arquivos do seu projeto para o diretório padrão do Apache
COPY . /var/www/html/

# Instala extensões PHP necessárias (exemplo: mysqli, pdo_mysql)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expõe a porta 80 (Apache)
EXPOSE 80
