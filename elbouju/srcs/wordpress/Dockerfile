FROM alpine:latest

RUN apk add --no-cache --virtual .build-deps unzip
RUN apk add --no-cache apache2 php7 php7-apache2 php7-openssl php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib su-exec
RUN mkdir -p /run/apache2 /run/httpd

WORKDIR /scripts

ADD https://wordpress.org/wordpress-4.9.6.zip ./
RUN unzip -q wordpress-4.9.6.zip -d ./ && \
        rm -rf /var/www/localhost/htdocs && \
        mv wordpress/ /var/www/localhost/htdocs && \
        rm /scripts/wordpress-4.9.6.zip \
            /var/www/localhost/htdocs/wp-config-sample.php \
            /var/www/localhost/htdocs/license.txt \
            /var/www/localhost/htdocs/readme.html && \
        chown -R apache:apache /var/www/localhost/htdocs && \
        apk del .build-deps

COPY scripts/start.sh start.sh
COPY wp-config.php /var/www/localhost/htdocs/wp-config.php

EXPOSE 80 5050

ENTRYPOINT [ "./start.sh" ]
