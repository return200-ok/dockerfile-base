FROM php:7.4-fpm

RUN apt-get update && \
	apt-get install -y \
        nginx \
        zlib1g-dev \
        libpng-dev \
        curl \
        libcurl4-openssl-dev \
        pkg-config \
        libssl-dev \
        libzip-dev \
        libpq-dev \
	supervisor

# Install postgres extension docker-php-ext-install pdo pgsql pdo_pgsql
RUN docker-php-ext-install zip \
	&& docker-php-ext-install exif \
	&& docker-php-ext-install gd \
        && docker-php-ext-install pdo \
        && docker-php-ext-install pgsql \
        && docker-php-ext-install pdo_pgsql \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install pdo_mysql

# Install mongodb extension
RUN pecl install mongodb \
	&& docker-php-ext-enable mongodb

# Install composer
RUN apt-get install -y --no-install-recommends git zip && \
	curl --silent --show-error https://getcomposer.org/installer | php

#Copy supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure Services and Ports
COPY default /etc/nginx/sites-available/
COPY php.ini /usr/local/etc/php
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
EXPOSE 80 443