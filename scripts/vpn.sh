#!/bin/bash
#=============================================================================#
# Title       : vpn.sh
# Description : Stablishes connection to a VPN
# Author      : Cristian Llanos <cristianllanos@outlook.com>
# Date        : 2016-09-09T18:40:00Z-05:00
# Usage       : vpn [connection]
#=============================================================================#

SOURCE=${BASH_SOURCE[0]}

# If the user needs sudo privileges, proxy the command using sudo.
if [[ "$EUID" -ne 0 ]]
then
    sudo ${SOURCE} "$@"
    exit
fi

openvpn --config ~/vpn/${1}.ovpn
