ARG PHP_VERSION="7.2"
FROM php:${PHP_VERSION}-fpm-alpine
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"

ENV PHP_VERSION="${PHP_VERSION}"

RUN apk add --no-cache --virtual .build-deps gcc make coreutils libc-dev autoconf \
    && apk add --no-cache --virtual .deps libzip-dev libjpeg-turbo-dev libltdl libpng-dev freetype-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install iconv mysqli pdo pdo_mysql zip gd \
    && apk del .build-deps

WORKDIR /app
