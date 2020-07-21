#!/bin/sh
mysql -h $WORDPRESS_DB_HOST -u $WORDPRESS_DB_USER --password=$WORDPRESS_DB_PASSWORD

docker-entrypoint.sh php-fpm

/usr/sbin/nginx && /usr/local/sbin/php-fpm