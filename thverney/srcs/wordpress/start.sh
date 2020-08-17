#!/bin/sh
mkdir /run/nginx
touch /run/nginx/nginx.pid
# echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
# echo "CREATE USER 'root'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
# echo "DROP DATABASE test" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# mysql wordpress -u root --password=  < wordpress.sql
mkdir -p /run/mysqld
# mysql_install_db --user=root --basedir=/usr

echo "User: " $WORDPRESS_DB_USER;
echo "Host: " $WORDPRESS_DB_HOST;
echo "Password: " $WORDPRESS_DB_PASSWORD;
mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD ;
while [ $? != 0 ]
do
    sleep 2 ;
    echo "Command failed with error code: " $?;
    mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD
done
echo "After brutforce";
mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD -e 'CREATE DATABASE wordpress;';
echo "After wp creaction";
mysql -u $WORDPRESS_DB_USER -h $WORDPRESS_DB_HOST -p$WORDPRESS_DB_PASSWORD wordpress < /wordpress-dump.sql;

echo "je comprends r";

/usr/sbin/nginx
telegraf &
php-fpm7 -F