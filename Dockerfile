FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

# Install strongSwan
RUN apt-get update
RUN apt-get install -y strongswan kmod;
RUN apt-get clean

# Copy scripts
ADD start.sh /root/
ADD strongswan.conf /etc/strongswan.d/strongswan.conf
ADD gen-ipsec-conf.sh /root/
ADD gen-ipsec-secrets.sh /root/

# Run
ENTRYPOINT ["/root/start.sh"]
