#!/usr/bin/env sh

service supervisord stop
supervisord -c /etc/supervisord.conf

php artisan config:cache
#php artisan route:cache
php artisan view:cache
/sbin/runit-wrapper
