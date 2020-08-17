FROM alpine

VOLUME ["/home"]

RUN apk update

#ftp/ssl
RUN apk add bash pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
COPY pure-ftpd.pem /etc/ssl/private/

RUN mkdir /etc/telegraf \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz \
&& tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz \
&& chmod 775 telegraf/* \
&& cp telegraf/telegraf /usr/bin/ \
&& rm -rf /var/cache/apk/*
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY setup.sh /setup.sh
RUN chmod 775 /setup.sh 

EXPOSE 21 21000

ENTRYPOINT ["/setup.sh"]