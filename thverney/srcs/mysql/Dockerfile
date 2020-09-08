FROM alpine:3.11.3

RUN apk update && \
	apk add --no-cache mysql mysql-client mariadb-server-utils bash && \
	rm -rf /var/cache/apk/*

RUN	touch mysql
RUN mkdir auth_pam_tool_dir
RUN mkdir /auth_pam_tool_dir/auth_pam_tool
RUN touch wordpress.sql

COPY setup.sh /bin/setup.sh
COPY my.cnf /etc/mysql/my.cnf
COPY my.cnf /etc/my.cnf
COPY my.cnf /var/lib/mysql/my.cnf

RUN mkdir /etc/telegraf \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz \
&& tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz \
&& chmod 775 telegraf/* \
&& cp telegraf/telegraf /usr/bin/ \
&& rm -rf /var/cache/apk/*
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306

ENTRYPOINT ["/bin/setup.sh"]
