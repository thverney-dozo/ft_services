FROM debian:buster

RUN apt-get update \
&& apt-get upgrade
RUN apt-get install nginx -y \
&& apt-get install mariadb-server -y \
&& apt-get install php-mbstring -y
RUN apt-get install wget -y \
&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz \
&& tar xvf phpMyAdmin-5.0.1-all-languages.tar.gz
RUN apt-get install php -y \
&& apt-get install php7.3-fpm -y \ 
&& apt-get install php7.3-mysql
RUN rm /etc/nginx/sites-available/default \
&& rm /var/www/html/index.html /var/www/html/index.nginx-debian.html \
&& mv phpMyAdmin-5.0.1-all-languages /var/www/html/phpMyadmin
RUN mkdir /var/www/html/phpMyadmin/tmp \
&& chmod 777 /var/www/html/phpMyadmin/tmp
RUN wget -c https://wordpress.org/latest.tar.gz \
&& tar -xvzf latest.tar.gz \ 
&& mv wordpress/ /var/www/html/ \
&& chown -R www-data:www-data /var/www/html/wordpress/ \
&& chmod 755 -R /var/www/html/wordpress/

RUN apt-get install openssl
RUN	mkdir /etc/nginx/ssl
ADD srcs/default /etc/nginx/sites-available/
ADD srcs/cert.pem /etc/nginx/ssl
ADD srcs/key.pem /etc/nginx/ssl

ADD	srcs/mariadb-setup.sql /etc/nginx/sites-available/
ADD srcs/config.inc.php /var/www/html/phpMyadmin/
ADD srcs/wp-config.php /var/www/html/wordpress

CMD nginx -t \
&& service nginx start \
&& service php7.3-fpm start \
&& service mysql start \
&& mysql -u root < /etc/nginx/sites-available/mariadb-setup.sql \
&& mysql -u root < /var/www/html/phpMyadmin/sql/create_tables.sql \
&& bash