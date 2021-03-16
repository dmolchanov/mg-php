FROM php:5.6-apache
LABEL MAINTAINER=dmolchanov@gmail.com
ARG WWW_USER="www-data"

RUN \
	docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
	docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
	docker-php-ext-install pdo pdo_mysql && \
	apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
    libzip4 libzip-dev \
	&& docker-php-ext-install -j$(nproc) iconv \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) gd 
  && docker-php-ext-enable gd iconv pdo pdo_mysql

