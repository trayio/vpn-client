FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# Install Strongswan
RUN apt-get update && \
    apt-get install -y strongswan kmod;
RUN apt-get clean

# Copy scripts
ADD start.sh /root/
ADD gen-ipsec-conf.sh /root/
ADD gen-ipsec-secrets.sh /root/

# Run
ENTRYPOINT ["/root/start.sh"]
