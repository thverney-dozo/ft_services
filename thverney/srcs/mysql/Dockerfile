FROM alpine:3.11.3

RUN apk update && \
	apk add mysql mysql-client && \
	rm -rf /var/cache/apk/*

RUN	mkdir ./mysql
RUN mkdir auth_pam_tool_dir
RUN mkdir /auth_pam_tool_dir/auth_pam_tool

COPY start.sh /bin/start.sh
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/my.cnf

EXPOSE 3306

ENTRYPOINT ["/bin/start.sh"]