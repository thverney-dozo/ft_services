/usr/sbin/sshd
echo "Apres /usr/sbin/sshd"
/usr/bin/telegraf &
nginx -g "daemon off;"