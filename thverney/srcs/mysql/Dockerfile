FROM alpine:latest

RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	rm -rf /var/cache/apk/*

COPY run.sh /bin/run.sh
COPY my.cnf /etc/mysql/my.cnf

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/bin/run.sh"]
