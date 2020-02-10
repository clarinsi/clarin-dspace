#!/bin/bash
#Put stop commands and cleanup here

### Apache ####
echo "Stop apache"
/usr/sbin/apache2ctl stop

### Shibboleth ###
if [ "NOTNEEDED" = "yes" ]; then
	echo "Stop shibboleth"
	countOfMatch=`ps -ejH | grep "shibd" -c`
	while [ $countOfMatch -gt 0 ]; do
	   numberOfProcess=`ps -ejH | grep "shibd" | sed 's/ *\([0-9]*\).*/\1/'`
	   kill $numberOfProcess
	   echo "Shibd process ($numberOfProcess) killed"
	   sleep 1;
	   countOfMatch=`ps -ejH | grep "shibd" -c`
	done
	echo "Shibboleth stopped!"
fi


### Tomcat ###
echo "Stopping tomcat"
/etc/init.d/tomcat7 stop
### Postgres ###
echo "Stopping postgres"
/etc/init.d/postgresql stop
### Handle server ###
HANDLE_SERVER=/etc/init.d/handle-server
if [[ -r $HANDLE_SERVER ]]; then
    echo "Stopping handle server";
    $HANDLE_SERVER stop;
else
    echo "Handle server not present - ignoring stop command";
fi
