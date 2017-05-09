FROM php:fpm-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

ENV PACKAGES="openssl binutils isl libatomic musl-dev re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp coreutils freetype-dev libjpeg-turbo-dev libltdl libmcrypt-dev libpng-dev" \
    INSTALL_EXTENSIONS="iconv mcrypt mysqli pdo pdo_mysql zip gd" \
    PECL_INSTALL="redis" \
    ENABLE_EXTENSIONS="redis.so"

RUN apk upgrade --update && apk add $PACKAGES \
    && docker-php-ext-install $INSTALL_EXTENSIONS \
    && rm -rf /var/cache/apk/* \
    && pecl install $PECL_INSTALL \
    && pecl clear-cache \
    && docker-php-ext-enable $ENABLE_EXTENSIONS

WORKDIR /app
