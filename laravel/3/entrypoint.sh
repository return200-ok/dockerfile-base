#!/bin/sh

php artisan config:clear 
php artisan config:cache 
/sbin/runit-wrapper

exec "$@"
