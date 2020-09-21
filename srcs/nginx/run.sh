#!/bin/bash

mkdir /www/wordpress /www/phpmyadmin /www/grafana
chown -R www:www /www && chmod 775 -R /www
/usr/sbin/sshd
/usr/bin/telegraf &
nginx &
while pgrep nginx >/dev/null && pgrep sshd >/dev/null && pgrep telegraf >/dev/null; do
    sleep 1;
done