# buildrpm start-stop-daemon

This project provides an RPM version for CentOS of the famous start-stop-daemon utility.

## Installation


See the [Packagecloud instructions](https://packagecloud.io/willgarcia/start-stop-daemon/install) to setup the RPM repository in your system

```bash
$ yum install start-stop-daemon
```

## Build

```bash
$ docker build --tag=start-stop-daemon .
$ docker run --rm -v `pwd`:"/root/build" start-stop-daemon
```

The RPM file can be found in `./start-stop-daemon-1.18.2-1.el6.x86_64.rpm`
