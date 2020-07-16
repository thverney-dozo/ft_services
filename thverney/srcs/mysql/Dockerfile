FROM alpine:latest

RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	rm -rf /var/cache/apk/*

COPY run.sh /bin/run.sh
COPY run_2.sh /bin/run_2.sh
COPY my.cnf /etc/mysql/my.cnf
RUN chmod 777 run.sh
RUN chmod 777 run_2.sh


VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/bin/run.sh"]
