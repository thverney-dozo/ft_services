#!/bin/sh

mysql -u $PMA_USER -h $PMA_HOST -p$MYSQL_ROOT_PASSWORD
while [ ?$ != 0] do
    mysql -u $PMA_USER -h $PMA_HOST -p$MYSQL_ROOT_PASSWORD;
    sleep 2;
done
php -S 0.0.0.0:5000 -t /www/