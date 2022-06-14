FROM phpearth/php:7.3-nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY vhost.conf /etc/nginx/conf.d/default.conf

COPY www.conf /etc/php/7.3/php-fpm.d/www.conf

RUN apk add --no-cache \
    php7.3-mbstring \
    php7.3-dom \
    php7.3-xml \
    php7.3-mysqli \
    php7.3-pdo \
    php7.3-pdo_mysql \
    composer