# Usa a imagem oficial do PHP 7.4 com Alpine Linux (leve)
FROM php:7.4-fpm-alpine

# Instala dependências do sistema necessárias
RUN apk update && \
    apk add --no-cache \
        gcc \
        g++ \
        make \
        autoconf \
        musl-dev \
        linux-headers \
        zlib-dev \
        libmcrypt-dev

# Instala extensões PHP necessárias
RUN docker-php-ext-install -j$(nproc) \
    mysqli \
    pdo \
    pdo_mysql

# Instala mcrypt via PECL (já que não está mais no core)
RUN pecl install mcrypt-1.0.4 && \
    docker-php-ext-enable mcrypt

# Limpeza final
RUN rm -rf /tmp/pear

# Define o diretório de trabalho
WORKDIR /var/www/html

# Permissão para o usuário www-data (opcional, dependendo do uso)
RUN chown -R www-data:www-data /var/www/html

# Expor porta (se for usar com nginx ou acesso direto)
EXPOSE 80

# Inicia o serviço PHP-FPM
CMD ["php-fpm"]
