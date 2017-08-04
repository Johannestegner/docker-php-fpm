FROM php:5.6-fpm-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

ENV PACKAGES="autoconf binutils gcc make isl libatomic musl-dev re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp coreutils redis freetype-dev libjpeg-turbo-dev libltdl libmcrypt-dev libpng-dev" \
    INSTALL_EXTENSIONS="iconv mcrypt mysqli pdo pdo_mysql zip gd"

RUN apk add --no-cache $PACKAGES \
    && pecl install redis-3.1.2 \
    && docker-php-ext-enable redis \ 
    && docker-php-ext-install $INSTALL_EXTENSIONS \
    && rm -rf /var/cache/apk/*

WORKDIR /app
