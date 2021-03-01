FROM php:7.4-apache-buster
LABEL MAINTAINER=dmolchanov@gmail.com
ARG WWW_USER="www-data"

RUN \
	docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
	docker-php-ext-configure mysqli --with-mysqli=mysqlnd && \
	docker-php-ext-install pdo pdo_mysql mysqli && \
	apt-get update && apt-get install -y \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libmcrypt-dev \
		libpng-dev \
	&& docker-php-ext-install -j$(nproc) iconv \
	&& docker-php-ext-configure gd \
	&& docker-php-ext-install -j$(nproc) gd

