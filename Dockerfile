FROM php:fpm-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

ENV PACKAGES="openssl binutils isl libatomic musl-dev re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp coreutils freetype-dev libjpeg-turbo-dev libltdl libmcrypt-dev libpng-dev" \
    EXTENSIONS="iconv mcrypt mysqli pdo pdo_mysql zip gd openssl"

RUN apk upgrade --update && apk add $PACKAGES \
    && docker-php-ext-install $EXTENSIONS \
    && rm -rf /var/cache/apk/*

WORKDIR /app
