#!/bin/bash
#=============================================================================#
# Title       : vhost-env.sh
# Description : Adds an environment variable to a Apache2 Virtual Host
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-07-01T18:36:00Z-05:00
# Usage       : vhost-env [vh]
#=============================================================================#

SOURCE=${BASH_SOURCE[0]}

# If the user needs sudo privileges, proxy the command using sudo.
if [[ "$EUID" -ne 0 ]]
then
    sudo ${SOURCE} "$@"
    exit
fi

VHOST=$1
ENV_KEY="$2"
ENV_VALUE="$3"

FILE="/etc/apache2/sites-available/${VHOST}"

echo "    SetEnv ${ENV_KEY} ${ENV_VALUE}" >> $FILE
