FROM docker-php-base:release-v1.7.1

WORKDIR /home/public_html/app

RUN apk add --no-cache \
    php7.3-gd \
    php7.3-intl \
    php7.3-pdo_mysql \
    openrc

# Install composer 2
RUN which composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir /usr/bin --filename composer
RUN php -r "unlink('composer-setup.php');"

COPY composer.json composer.json

COPY composer.lock composer.lock

RUN composer install --prefer-dist --no-progress --no-scripts --no-autoloader && rm -rf /root/.composer

COPY . /home/public_html/app

RUN cp .env.production .env \
    && chown -R www-data:www-data storage bootstrap \
    && composer dump-autoload --no-scripts --optimize

VOLUME ["/home/public_html/app/storage"]

RUN chmod +x start.sh
RUN chmod -R 755 /home/public_html/app/storage
RUN cp start.sh /etc/start.sh


ENTRYPOINT ["/etc/start.sh"]