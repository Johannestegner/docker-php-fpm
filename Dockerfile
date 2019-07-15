ARG PHP_VERSION="7.3"
FROM registry.gitlab.com/jitesoft/dockerfiles/php/fpm:${PHP_VERSION}
RUN apk add --no-cache --virtual .build-deps gcc make coreutils libc-dev autoconf \
    && apk add --no-cache --virtual .deps libzip-dev libjpeg-turbo-dev libltdl libpng-dev freetype-dev \
    && pecl install redis \
    && php-ext enable redis \
    && php-ext install iconv mysqli pdo pdo_mysql zip gd \
    && apk del .build-deps

VOLUME /app
WORKDIR /app
