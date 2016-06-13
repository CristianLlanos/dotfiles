#!/bin/bash
#=============================================================================#
# Title       : vhost.sh
# Description : Registers an Apache2 Virtual Host.
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-06-12T19:30:00Z-05:00
# Usage       : vhost [vh]
#=============================================================================#

NAME=$(basename "$PWD")
PUBLIC=$(pwd)/public
DOMAIN=${1:-"vh"}

if [ ! -d ${PUBLIC} ]; then
    echo "This project does not have a [./public] directory to use a document root"
    exit 1
fi

SERVER_NAME=${NAME}.${DOMAIN}
CONFIGURATION_FILE=/etc/apache2/sites-available/${SERVER_NAME}.conf

sudo touch ${CONFIGURATION_FILE}
sudo echo "<VirtualHost *:80>" >> ${CONFIGURATION_FILE}
sudo echo "    ServerName ${SERVER_NAME}" >> ${CONFIGURATION_FILE}
sudo echo "    DocumentRoot ${PUBLIC}" >> ${CONFIGURATION_FILE}
sudo echo "</VirtualHost>" >> ${CONFIGURATION_FILE}

sudo echo "127.0.0.1 ${SERVER_NAME}" >> /etc/hosts

sudo a2ensite ${SERVER_NAME}
sudo service apache2 reload
