FROM alpine:3.11.3

RUN apk -f update && \
	apk -f add nginx mysql-client mysql-server wget bash
RUN apk -f add php7-fpm php7-mbstring php7-session php7-mysqli php7-gettext \
    php7-pdo php7-zip php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
    php7-pdo_mysql php7-pdo_sqlite php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib \
    php7-curl php7-ctype php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom

RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz \
&& tar -xvf latest-fr_FR.tar.gz
RUN mv wordpress /var/www/.

RUN mkdir /etc/telegraf \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz \
&& tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz \
&& chmod 775 telegraf/* \
&& cp telegraf/telegraf /usr/bin/ \
&& rm -rf /var/cache/apk/*
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN touch /wordpress-dump.sql
COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod 777 /etc/nginx/nginx.conf
COPY start.sh start.sh
COPY wp-config.php /var/www/wp-config.php
COPY wordpress.sql wordpress.sql


ENTRYPOINT ["/start.sh"]