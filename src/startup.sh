#/bin/sh

appPath="/app/telegram-sonarr-bot-master"
ln -s /config/config.json "$appPath"/config.json
if [ -f /config/acl.json ]; then
	echo "File exists..."
else
	cp "$appPath"/acl.json.template /config/acl.json
	chown nobody:nobody /config/acl.json
fi

ln -s /config/acl.json "$appPath"/acl.json
chown nobody:nobody -R "$appPath"

##Start supervisord

/usr/bin/supervisord -c /etc/supervisord.conf