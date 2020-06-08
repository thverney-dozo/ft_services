FROM nginx:alpine

RUN apk upgrade --update-cache --available \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/*
RUN	mkdir /etc/nginx/ssl
ADD nginx/default.conf /etc/nginx/default.conf
ADD nginx/cert.pem /etc/nginx/ssl
ADD nginx/key.pem /etc/nginx/ssl

CMD nginx -t \
&& nginx -g 'daemon off;'
