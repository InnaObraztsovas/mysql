FROM php:8.1-cli

WORKDIR /app

RUN docker-php-ext-install pdo_mysql

COPY --from=composer:2.1.9 /usr/bin/composer /usr/bin/composer