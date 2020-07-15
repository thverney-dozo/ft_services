FROM alpine:latest

RUN apk update && apk add wget && mkdir /www \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN mkdir -p /run/apache2 /run/httpd

WORKDIR /scripts

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& mv wordpress/* /www \
&& rm -rf /var/cache/apk/*

COPY start.sh start.sh
COPY wp-config.php /var/www/localhost/htdocs/wp-config.php

EXPOSE 80 5050

ENTRYPOINT [ "./start.sh" ]