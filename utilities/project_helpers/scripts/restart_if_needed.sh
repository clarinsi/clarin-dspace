#!/bin/bash

cd "$(cd "$(dirname "$0")" ; pwd -P )"
date

# Restart DSpace stack if repository is not responding with HTTP 200.
status=`curl -k -o /dev/null -s -w "%{http_code}" https://localhost/repository/xmlui/`
if [[ $status -ne "200" ]]; then
    echo "Automatically restarting DSpace stack due to HTTP status $status ..."
    ./stop_stack.sh
    sleep 3
    ./start_stack.sh
    echo "DSpace stack restart complete."
else
    echo "No restart needed: HTTP status is $status."
fi

date
echo
