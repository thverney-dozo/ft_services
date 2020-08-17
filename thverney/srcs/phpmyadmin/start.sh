#!/bin/sh
echo "Entering phpmyadmin"
mysql -u $PMA_USER -h $PMA_HOST -p$MYSQL_ROOT_PASSWORD
while [ $? != 0 ]
do
    echo "Command failed with error code: " $?;
    sleep 2 ;
    mysql -u $PMA_USER -h $PMA_HOST -p$MYSQL_ROOT_PASSWORD;
done
echo "Successfully accessed mysql";
echo "User: " $PMA_USER;
echo "Host: " $PMA_HOST;
echo "PAssword: " $MYSQL_ROOT_PASSWORD;
# php-fpm7 -F /www/ & nginx
telegraf &
php -S 0.0.0.0:5000 -t /www/
# /usr/sbin/nginx
# php-fpm7 -F /www/