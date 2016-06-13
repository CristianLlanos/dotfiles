#!/bin/bash
#=============================================================================#
# Title       : vhost.sh
# Description : Registers an Apache2 Virtual Host.
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-06-12T19:30:00Z-05:00
# Usage       : vhost [vh]
#               vhost forget [vh]
#=============================================================================#

SOURCE=${BASH_SOURCE[0]}

# If the user needs sudo privileges, proxy the command using sudo.
if [[ "$EUID" -ne 0 ]]
then
    sudo ${SOURCE} "$@"
    exit
fi

NAME=$(basename "$PWD")
PUBLIC=$(pwd)/public

if [ ! -d ${PUBLIC} ]
then
    echo "This project does not have a [./public] directory to use as document root"
    exit 1
fi

if [[ "$1" = "forget" ]]
then
    DOMAIN=${2:-"vh"}
    PROJECT=${NAME}.${DOMAIN}
    rm /etc/apache2/sites-enabled/${PROJECT}.conf &> /dev/null
    rm /etc/apache2/sites-available/${PROJECT}.conf &> /dev/null
    sed "/${PROJECT}/d" /etc/hosts >> /etc/hosts.new
    rm /etc/hosts.bk &> /dev/null
    mv /etc/hosts /etc/hosts.bk
    mv /etc/hosts.new /etc/hosts

    echo ">> [${PROJECT}] virtual host has been removed from this server."
    exit
fi

DOMAIN=${1:-"vh"}
PROJECT=${NAME}.${DOMAIN}
CONFIGURATION=/etc/apache2/sites-available/${PROJECT}.conf

touch ${CONFIGURATION}
echo "<VirtualHost *:80>" >> ${CONFIGURATION}
echo "    ServerName ${PROJECT}" >> ${CONFIGURATION}
echo "    DocumentRoot ${PUBLIC}" >> ${CONFIGURATION}
echo "</VirtualHost>" >> ${CONFIGURATION}

echo "127.0.0.1 ${PROJECT}" >> /etc/hosts

a2ensite ${PROJECT}
service apache2 reload

echo ">> [http://${PROJECT}] is now available on this server."
