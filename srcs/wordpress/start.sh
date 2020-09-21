#!/bin/sh
mkdir /run/nginx
touch /run/nginx/nginx.pid
mkdir -p /run/mysqld

sleep 50;

mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD -e 'CREATE DATABASE wordpress;';

mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD -e 'USE wordpress;';

mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD wordpress < /wordpress.sql;

/usr/sbin/nginx &
telegraf &
php-fpm7 -F &
while pgrep nginx >/dev/null && pgrep php-fpm >/dev/null && pgrep telegraf >/dev/null; do
    sleep 1;
done
