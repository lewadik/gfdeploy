#!/bin/bash

set -e

mkdir -p /opt/glassfish3/glassfish/nodes/localhost-domain1/agent/config
cat << EOT > /opt/glassfish3/glassfish/nodes/localhost-domain1/agent/config/das.properties
agent.das.protocol=http
agent.das.port=4848
agent.das.host=localhost
agent.das.isSecure=false
EOT

cd /opt/glassfish3/glassfish/nodes/localhost-domain1/ && mkdir instance1-gs2c/ && mkdir instance1-userservice/ && \
mkdir instance1-dataexportapi/ && mkdir instance1-inwardservice/ && mkdir instance1-inward/ && \
mkdir instance1-system-service/ && mkdir instance1-cis/ && mkdir instance1-fin/ && mkdir instance1-cashier/ && \
mkdir instance1-gms && mkdir instance1-bingoengine/

expect -c 'spawn asadmin --user admin --passwordfile /glassfish.passwords start-local-instance --node localhost-domain1 --sync full instance1-userservice; expect "Do you trust the above certificate" {send -- "y\r"}'
expect -c 'spawn asadmin --user admin --passwordfile /glassfish.passwords start-local-instance --node localhost-domain1 --sync full instance1-gms; expect "Do you trust the above certificate" {send -- "y\r"}'
