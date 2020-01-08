ARG PHP_VERSION
FROM registry.gitlab.com/jitesoft/dockerfiles/php/fpm:${PHP_VERSION}
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>" \
      maintainer.org="Jitesoft" \
      maintainer.org.uri="https://jitesoft.com" \
      com.jitesoft.project.repo.type="git" \
      com.jitesoft.project.repo.uri="https://gitlab.com/jitesoft/dockerfiles/php-fpm" \
      com.jitesoft.project.repo.issues="https://gitlab.com/jitesoft/dockerfiles/php-fpm/issues" \
      com.jitesoft.project.registry.uri="registry.gitlab.com/jitesoft/dockerfiles/php-fpm"

RUN apk add --no-cache --virtual .build-deps gcc make coreutils libc-dev autoconf \
 && apk add --no-cache --virtual .deps libzip-dev libjpeg-turbo-dev libltdl libpng-dev freetype-dev \
 && pecl install redis \
 && php-ext enable redis \
 && php-ext install zip gd \
 && apk del .build-deps

VOLUME /app
WORKDIR /app
