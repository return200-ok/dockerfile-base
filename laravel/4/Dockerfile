FROM php-nginx-base:0.1

WORKDIR /home/public_html/app

RUN apk add --no-cache \
    php7.3-curl \
    php7.3-intl \
    php7.3-mbstring \
    php7.3-openssl \
    php7.3-pdo \
    php7.3-pdo_mysql \
    php7.3-tokenizer \
    php7.3-gd

COPY composer.json composer.json

RUN composer install --prefer-dist --no-progress --no-scripts --no-autoloader && rm -rf /root/.composer

COPY . /home/public_html/app

RUN cp .env.production .env \
    && mkdir -p storage/app/db-blade-compiler/views \
    && chown -R www-data:www-data storage bootstrap \
    && chmod 755 -R storage \
    && composer dump-autoload --no-scripts --optimize

VOLUME ["/home/public_html/app/storage"]

RUN php artisan vendor:publish --all

ENTRYPOINT php artisan config:clear && php artisan config:cache && /sbin/runit-wrapper
