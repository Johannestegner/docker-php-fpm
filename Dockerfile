FROM php:fpm-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

ENV PACKAGES binutils \
             isl \
             libatomic \
             musl-dev \
             re2c \
             libstdc++ \
             libgcc \
             binutils-libs \
             mpc1 \
             mpfr3 \
             gmp \
             libgomp \
             coreutils \
             freetype-dev \
             libjpeg-turbo-dev \
             libltdl \
             libmcrypt-dev \
             libpng-dev

ENV EXTENSIONS iconv mcrypt mysqli pdo pdo_mysql zip

RUN apk upgrade --update && apk add $PACKAGES \
    && docker-php-ext-install  $EXTENSIONS \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && apk del autoconf file $PACKAGES \
    && rm -rf /var/cache/apk/*

WORKDIR /app
