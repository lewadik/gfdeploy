#!/bin/bash

set -e

asadmin start-domain 
if [ ! -f /.glassfish_admin_password_changed ]; then
    /change_admin_password.sh
fi
echo "=> Restarting Glassfish server"
asadmin stop-domain
echo "=> Starting and running Glassfish server"
#mv /*.war /opt/glassfish3/glassfish/domains/domain1/autodeploy/
#rm -rf /opt/glassfish3/glassfish/domains/domain1/config/
#mv /config /opt/glassfish3/glassfish/domains/domain1/config/
asadmin start-domain -v
