#!/bin/bash

telegraf &
{ echo "www"; echo "www"; } | adduser www
chown -R www /home/www
chmod -R 775 /home/www 

/usr/sbin/pure-ftpd -Y 2 -p 21000:21003 -P 192.168.99.100