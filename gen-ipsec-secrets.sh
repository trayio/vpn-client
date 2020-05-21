#!/bin/sh

cat  << EOF
# ipsec.secrets - strongSwan IPsec secrets file

$TUNNEL_1_IP_ADDRESS : PSK "$TUNNEL_1_PSK_SECRET"
$TUNNEL_2_IP_ADDRESS : PSK "$TUNNEL_2_PSK_SECRET"
EOF
