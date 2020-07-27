FROM alpine:latest

MAINTAINER Gaetan Fournier <gaefourn@student.42.fr>

RUN wget -c https://wordpress.org/latest.tar.gz && \
tar -zxf latest.tar.gz && \
mv wordpress /var/www/html/

EXPOSE 5050

COPY wordpress/wp-config.php /var/www/html/wordpress/