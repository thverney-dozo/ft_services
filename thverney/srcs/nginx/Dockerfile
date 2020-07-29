FROM alpine:latest

RUN apk update && apk add nginx \
&& apk add --no-cache --upgrade bash \
&& apk add openssl && mkdir -p var/run/nginx \
&& apk add openssl openssh \
&& rm -rf /var/cache/apk/* \
&& apk add --update openssh

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

COPY id_rsa /etc/ssh/ssh_host_rsa_key
COPY id_rsa.pub /authorized_keys
COPY sshd_config /sshd_config


RUN adduser -D "user"
RUN echo "user:password" | chpasswd
RUN echo "user:password = user:password"
RUN	mkdir /etc/nginx/ssl
RUN ssh-keygen -A
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=FR/ST=75/L=Paris/O=42/CN=thverney' -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
RUN echo 'SSH ft_services/nginx' > /etc/motd

RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

RUN mv -f /sshd_config /etc/ssh/sshd_config \
&& mkdir .ssh \
&& mv /authorized_keys .ssh/authorized_keys

RUN chmod 600 /etc/ssh/ssh_host_rsa_key \
&& chmod 700 .ssh \
&& chmod 644 .ssh/authorized_keys \
&& chmod 644 /etc/nginx/ssl/nginx.crt \
&& chmod 600 /etc/nginx/ssl/nginx.key

COPY run.sh .
RUN chmod 777 run.sh

EXPOSE 22 80 443

CMD ./run.sh