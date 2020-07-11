FROM nginx:alpine

RUN apk upgrade --update-cache --available \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/*
RUN	mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=elbouju' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

ADD default.conf /etc/nginx/default.conf
ADD cert.pem /etc/nginx/ssl
ADD key.pem /etc/nginx/ssl

CMD nginx -t \
&& nginx -g 'daemon off;

EXPOSE 80
