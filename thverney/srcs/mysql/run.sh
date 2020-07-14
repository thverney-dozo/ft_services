#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
fi

if [ -d /var/lib/mysql/mysql ]; then
	echo '[i] MySQL directory already present, skipping creation'
else
	echo "[i] MySQL data directory not found, creating initial DBs"

	echo 'Initializing database'
	mysql_install_db --user=root > /dev/null
	echo 'Database initialized'

	echo "[i] MySql root password: $MYSQL_ROOT_PASSWORD"

	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi

	echo "[i] Create temp file: $tfile"
	cat << EOF > $tfile
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO "$MYSQL_ROOT"@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
EOF

	echo 'FLUSH PRIVILEGES;' >> $tfile

	echo "[i] run tempfile: $tfile"
	/usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tfile
	rm -f $tfile
fi

echo "[i] Sleeping 5 sec"
sleep 5

echo '[i] start running mysqld'
exec /usr/bin/mysqld --user=root --console
