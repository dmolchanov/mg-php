FROM php:5.6-apache
LABEL MAINTAINER=dmolchanov@gmail.com
ARG WWW_USER="www-data"

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libzip4 libzip-dev \
    libsqlite3-0 libsqlite3-dev \
  && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd  \
  && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) iconv gd pdo pdo_mysql pdo_sqlite mcrypt mysql mysqli  zip 
