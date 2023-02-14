FROM docker-php-base:release-v1.3.9

WORKDIR /home/public_html/app

RUN apk add --no-cache \
    php7.3-gd \
    php7.3-intl \
    php7.3-redis \
    openrc

RUN mkdir -p /etc/supervisor/conf.d/
RUN mkdir -p /var/log/supervisor/
COPY  supervisor/admin-pg.conf /etc/supervisor/conf.d/


COPY composer.json composer.json

COPY composer.lock composer.lock

RUN composer install --prefer-dist --no-progress --no-scripts --no-autoloader && rm -rf /root/.composer

COPY . /home/public_html/app

RUN cp .env.production .env \
    && chown -R www-data:www-data storage bootstrap \
    && composer dump-autoload --no-scripts --optimize

RUN echo "*       *       *       *       *       cd /home/public_html/app && php artisan schedule:run >> /dev/null 2>&1" >> /etc/crontabs/root

VOLUME ["/home/public_html/app/storage"]

RUN chmod +x start.sh
RUN cp start.sh /etc/start.sh

ENTRYPOINT ["/etc/start.sh"]
