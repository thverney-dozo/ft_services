#!/bin/bash
telegraf &
sleep 5
/usr/sbin/grafana-server web &
while pgrep grafana-server >/dev/null && pgrep telegraf >/dev/null; do
    sleep 1;
done