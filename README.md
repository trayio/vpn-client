# Tray.io VPN Client

This is a simple VPN client that enables Tray users to connect to their own dedicated Tray environment via a secure private network.

## Getting Started

Please note that you need to have a dedicated Tray account and the credentials file provided to you in order to use this VPN client.

### Prerequisities

In order to build and run this VPN client, make sure that you have [Docker](https://docs.docker.com/linux/started/) installed on your local machine.

As this image is designed to use the [host's network interface](https://docs.docker.com/network/host/), only Docker on Linux is supported at this time.

Finally, make sure that you've downloaded the credentials file and store it on the host machine where this container will be deployed.

### Building

To build the container, simply clone the repository and run the build command:

```shell
docker build -t tray-vpn-client:latest .
```

### Usage

To start the VPN client, simply run this command:

```shell
docker run -d \
--rm \
--network=host
--cap-add=NET_ADMIN \
--cap-add=SYS_MODULE \
--env-file /path/to/tray-vpn-credentials.env \
tray-vpn-client:latest
```

In situations where passing a variable file might not be available to you, you can also pass the variables using the `-e` or `--env' options. For example:

```shell
docker run ... --env VAR1=value1 --env VAR2=value2 ... tray-vpn-client:latest
```

The values can be omitted if they are already set on the host's environment variable. For example:

```shell
export VAR1=value1
export VAR2=value2

docker run ... --env VAR1 --env VAR2 ... tray-vpn-client:latest
```

For more details, refer to the [Docker Run](https://docs.docker.com/engine/reference/run/) documentation for other options available for you, such as adding a nice name to the container.

#### The parameters

Here's a little explanation about the different parameters used to run the docker container:

* The `-d` option starts the container in the background (detached).
* The `--rm` option ensures that the container is removed once it exits/stops.
* The `--network` option enables the container to directly interface with the host's network.
* The `--cap-add` option adds additional capabilities for Linux to modify system level network.
* The `--env-file` option imports the credential files provided by Tray.

Note that the `--rm` flag is added for convenience but you may choose to omit it to help with troubleshooting purposes.

## Support

If you discover any problems or want to suggest ideas to improve this VPN client, please open an issue here before submitting a PR.