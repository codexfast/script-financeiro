# Usa a imagem do PHP 7.4 com Apache
FROM php:7.4-apache

# Mantenedor
LABEL maintainer="seu-email@exemplo.com"

# Instala dependências para compilar extensões
RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    gcc \
    g++ \
    make \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

# Instala as extensões PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Instala mcrypt via PECL
RUN pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt

# Habilita o módulo do Apache para reescrita (útil para .htaccess)
RUN a2enmod rewrite

# Diretório raiz do Apache
WORKDIR /var/www/html

# Copia arquivos PHP (ex: index.php) - opcional
# COPY . /var/www/html/

# Expõe a porta 80
EXPOSE 80

# O Apache já é o CMD padrão da imagem, mas deixamos explícito
CMD ["apache2-foreground"]
