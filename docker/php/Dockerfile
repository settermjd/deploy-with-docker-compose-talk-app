ARG ALPINE_VERSION=3.15
ARG PHP_VERSION=8.1.1

FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION} as base

FROM base as development

ARG ENV
RUN if [ "$ENV" = "development" ]; then \
    apk --update-cache add autoconf gcc musl-dev make && pecl install xdebug \
        && docker-php-ext-enable xdebug \
        && docker-php-ext-install pdo_mysql; \
fi

FROM base as dependencies

WORKDIR /var/www/html

COPY . .

COPY --from=composer:2.2.7 /usr/bin/composer /usr/bin/

RUN /usr/bin/composer install \
    --no-dev --no-ansi --no-plugins --no-progress --no-scripts \
    --classmap-authoritative --no-interaction \
    --quiet

FROM base as final

WORKDIR /var/www/html

RUN docker-php-ext-install pdo_mysql

COPY --from=dependencies /var/www/html .
