FROM php:fpm-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

RUN apk upgrade --update && apk add \
  binutils \
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
  libpng-dev \
&& docker-php-ext-install iconv mcrypt mysqli pdo pdo_mysql zip \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& apk del autoconf file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
&& rm -rf /var/cache/apk/*

WORKDIR /app
