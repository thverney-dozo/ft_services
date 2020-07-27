FROM alipne:latest

MAINTAINER Gaetan Fournier <gaefourn@student.42.fr>

RUN apk-get update && \
apk-get upgrade -y && \
apk-get install -y wget && \
apk-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip php-mysql

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz && \
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz && \ 
mv phpMyAdmin-4.9.0.1-all-languages/ /var/www/html/phpMyAdmin;

EXPOSE 5000