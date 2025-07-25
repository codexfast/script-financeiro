# Imagem oficial PHP 5.6 com Apache
FROM php:5.6-apache

# Copia os arquivos do projeto
COPY . /var/www/html/

# Instala extensões PHP necessárias (ajuste conforme necessário)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expõe a porta 80
EXPOSE 80
