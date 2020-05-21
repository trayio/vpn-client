#!/bin/sh

cat  << EOF
# ipsec.conf - strongSwan IPsec configuration file

config setup
	# strictcrlpolicy=yes
	# uniqueids=no

# Default configuration
conn %default
	authby=psk
	auto=route
	compress=no
	dpdaction=restart
	esp=aes128-sha1-modp1024!
	ike=aes128-sha1-modp1024!
	ikelifetime=28800s
	installpolicy=yes
	keyexchange=ikev1
	keyingtries=3
	lifetime=3600s
	mobike=no
	rekeymargin=3m
	type=tunnel

# Tunnel 1 configuration
conn tunnel-1
	auto=start
	leftsubnet=$CLIENT_NETWORK
	right=$TUNNEL_1_IP_ADDRESS
	rightsubnet=$TRAY_NETWORK

# Tunnel 2 configuration
conn tunnel-2
	auto=start
	leftsubnet=$CLIENT_NETWORK
	right=$TUNNEL_2_IP_ADDRESS
	rightsubnet=$TRAY_NETWORK
EOF
