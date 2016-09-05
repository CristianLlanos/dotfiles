#!/bin/bash
#=============================================================================#
# Title       : putenv.sh
# Description : Adds an environment variable to a Apache2 Virtual Host
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-07-01T18:36:00Z-05:00
# Usage       : putenv <key> <value>
#=============================================================================#

SOURCE=${BASH_SOURCE[0]}

# If the user needs sudo privileges, proxy the command using sudo.
if [[ "$EUID" -ne 0 ]]
then
    sudo ${SOURCE} "$@"
    exit
fi

NAME=$(basename "$PWD")
VHOST=${NAME}.vh
ENV_KEY="$1"
ENV_VALUE="$2"

FILE="/etc/apache2/sites-available/${VHOST}.conf"

sed -i "s/<\/VirtualHost>/    SetEnv ${ENV_KEY} ${ENV_VALUE}\n<\/VirtualHost>/" $FILE
service apache2 reload
echo ">> [${ENV_KEY}] with value [${ENV_VALUE}] is now available on [http://${VHOST}]."
