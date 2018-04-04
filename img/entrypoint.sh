#!/bin/bash

set -e

cd ~/.config/radicale/
sed -i "s|LDAP_URL|$LDAP_URL|g" config
sed -i "s|LDAP_BASE|$LDAP_BASE|g" config
sed -i "s|LDAP_ATTRIBUTE|$LDAP_ATTRIBUTE|g" config
sed -i "s|LDAP_FILTER|$LDAP_FILTER|g" config
sed -i "s|LDAP_BINDDN|$LDAP_BINDDN|g" config
sed -i "s|LDAP_PASSWORD|$LDAP_PASSWORD|g" config

radicale
exec $0
