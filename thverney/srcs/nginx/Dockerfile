FROM alpine:latest

RUN apk update && apk add nginx \
&& apk add --no-cache --upgrade bash \
&& apk add openssl && mkdir -p var/run/nginx \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/*

RUN mkdir -p var/run/nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

RUN	mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=thverney' -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

RUN adduser -D user
RUN echo "root:password"|chpasswd

COPY id_rsa_key_ssh /etc/ssh/ssh_host_rsa_key

COPY run.sh .
RUN chmod 600 /etc/ssh/ssh_host_rsa_key
RUN chmod 777 run.sh

EXPOSE 4000 80 443

CMD ./run.sh