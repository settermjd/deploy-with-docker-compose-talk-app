FROM php:7.4-fpm-alpine3.13 as composer

RUN apk add --update git

# setup composer -- taken from the composer docker installer code
RUN curl --silent --fail --location --retry 3 --output /tmp/installer.php --url https://raw.githubusercontent.com/composer/getcomposer.org/cb19f2aa3aeaa2006c0cd69a7ef011eb31463067/web/installer \
 && php -r " \
    \$signature = '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5'; \
    \$hash = hash('sha384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
      unlink('/tmp/installer.php'); \
      echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
      exit(1); \
    }" \
 && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer \
 && composer --ansi --version --no-interaction \
 && rm -f /tmp/installer.php

FROM php:7.4-fpm-alpine3.13 as dependencies

WORKDIR /var/www/html

COPY . .
COPY --from=composer /usr/bin/composer /usr/bin/

RUN /usr/bin/composer install \
    --no-dev --no-ansi --no-plugins --no-progress --no-scripts \
    --classmap-authoritative --no-interaction \
    --quiet

RUN docker-php-ext-install pdo_mysql

# Disable development mode
# Should be added to a script where it also checks directory permissions.
RUN rm -f config/autoload/development.local.php config/development.config.php

EXPOSE 80 9000