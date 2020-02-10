#!/bin/bash
#Put start commands here

### Postgres ###
echo "Starting postgres"
/etc/init.d/postgresql start
### Tomcat ###
echo "Starting tomcat"
CATALINA_OPTS="-Xms512M -Xmx2048M"
/etc/init.d/tomcat7 start
### Handle server ###
HANDLE_SERVER=/etc/init.d/handle-server
if [[ -r $HANDLE_SERVER ]]; then
    echo "Starting handle server";
    $HANDLE_SERVER start;
else
    echo "Handle server not present - ignoring start command";
fi
### Shibboleth ###
if [ "NOTNEEDED" = "yes" ]; then
	echo "Starting shibboleth"
	/etc/init.d/shibboleth start &
	sleep 30
fi
### Apache ###
echo "Starting apache"
/usr/sbin/apache2ctl start

