FROM nginx:alpine

RUN apk upgrade --update-cache --available \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/*
RUN	mkdir /etc/nginx/ssl
ADD default.conf /etc/nginx/default.conf
ADD cert.pem /etc/nginx/ssl
ADD key.pem /etc/nginx/ssl

CMD nginx -t \
&& nginx -g 'daemon off;'
