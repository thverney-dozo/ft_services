FROM alpine:3.11.3

RUN apk -f update && apk upgrade && apk add bash \
    apk -f add nginx mysql mysql-client mysql-server wget \
    php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk -f add php7-gettext \
    php7-pdo php7-zip php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc \
    php7-pdo_mysql php7-pdo_sqlite php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib \
    php7-curl php7-ctype php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /www \
&& rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
RUN chmod 777 /etc/nginx/nginx.conf
COPY phpmyadmin.inc.php /www/config.inc.php
COPY start.sh /bin/start.sh

RUN chmod 777 /bin/start.sh

EXPOSE 5000

ENTRYPOINT ["/bin/start.sh"]