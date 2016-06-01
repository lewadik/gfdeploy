#!/bin/bash

set -e

asadmin restore-domain --filename /tmp/domain1_2016_05_31_v00001.zip --force domain1
asadmin start-domain
echo "=> Starting restore script"
/restore.sh
asadmin stop-domain
echo "=> Starting and running Glassfish server"
rm -f /opt/glassfish3/glassfish/domains/domain1/config/domain.xml
mv /domain.xml /opt/glassfish3/glassfish/domains/domain1/config/
asadmin start-domain -v domain1
