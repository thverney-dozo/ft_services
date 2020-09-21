influxd run -config /etc/influxdb.conf &
telegraf &
while pgrep influxd >/dev/null && pgrep telegraf >/dev/null; do
    sleep 1;
done