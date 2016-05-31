#!/bin/bash

set -e

asadmin start-domain 
if [ ! -f /.glassfish_admin_password_changed ]; then
    /change_admin_password.sh
fi
echo "=> Restarting Glassfish server"
asadmin stop-domain
asadmin restore-domain  domain1 --filename /tmp/domain1/domain1_2016_05_31_v00001.zip --force
echo "=> Starting and running Glassfish server"
#mv /*.war /opt/glassfish3/glassfish/domains/domain1/autodeploy/
#rm -rf /opt/glassfish3/glassfish/domains/domain1/config/
#mv /config /opt/glassfish3/glassfish/domains/domain1/config/
asadmin start-domain -v
