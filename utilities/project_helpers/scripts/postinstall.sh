#!/bin/bash

DIR_SOURCE=/project/lindat-dspace/source
DIR_INSTALLATION=/project/lindat-dspace/installation

cp ${DIR_SOURCE}/../configs/default.license ${DIR_INSTALLATION}/config/
cp ${DIR_SOURCE}/../configs/alternative.license ${DIR_INSTALLATION}/config/
cp ${DIR_SOURCE}/../configs/input-forms.xml ${DIR_INSTALLATION}/config/
cp -r ${DIR_SOURCE}/../configs/sl ${DIR_INSTALLATION}/webapps/xmlui/themes/UFAL/lib/html/sl
rm ${DIR_SOURCE}/dspace/modules/xmlui/src/main/webapp/i18n/messages_sl.xml
