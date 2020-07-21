FROM wordpress:php7.4-fpm-alpine

RUN apk update && \
	apk add nginx mysql-client

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /bin/start.sh

ENTRYPOINT ["/bin/start.sh"]