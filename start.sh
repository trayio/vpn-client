#!/bin/sh

set -ex

# Exit if variables are missing
ERR_MSG="Unable to start VPN client. Please ensure that this variable is defined in the credentials file."
{
    : "${CLIENT_NETWORK?$ERR_MSG}"
    : "${TRAY_NETWORK?$ERR_MSG}"
    : "${TUNNEL_1_IP_ADDRESS?$ERR_MSG}"
    : "${TUNNEL_2_IP_ADDRESS?$ERR_MSG}"
    : "${TUNNEL_1_PSK_SECRET?$ERR_MSG}"
    : "${TUNNEL_2_PSK_SECRET?$ERR_MSG}"
}

# Generate VPN conf files
/root/gen-ipsec-conf.sh > /etc/ipsec.conf
/root/gen-ipsec-secrets.sh > /etc/ipsec.secrets

# Start service
/usr/sbin/ipsec start --nofork
