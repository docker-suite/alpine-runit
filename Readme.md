# ![](https://github.com/docker-suite/artwork/raw/master/logo/png/logo_32.png) alpine-runit
[![Build Status](http://jenkins.hexocube.fr/job/docker-suite/job/alpine-runit/badge/icon?color=green&style=flat-square)](http://jenkins.hexocube.fr/job/docker-suite/job/alpine-runit/)
![Docker Pulls](https://img.shields.io/docker/pulls/dsuite/alpine-runit.svg?style=flat-square)
![Docker Stars](https://img.shields.io/docker/stars/dsuite/alpine-runit.svg?style=flat-square)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/dsuite/alpine-runit/latest.svg?style=flat-square)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/dsuite/alpine-runit/latest.svg?style=flat-square)
[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![dockeri.co](https://dockeri.co/image/dsuite/alpine-runit)](https://hub.docker.com/r/dsuite/alpine-runit)

runit is an init scheme for Unix-like operating systems that initializes, supervises, and ends processes throughout the operating system.Runit is a reimplementation of the daemontools process supervision toolkit that runs on the Linux, Mac OS X, *BSD, and Solaris operating systems. Runit features parallelization of the start up of system services, which can speed up the boot time of the operating system.

Runit is an init daemon, so it is the direct or indirect ancestor of all other processes. It is the first process started during booting, and continues running until the system is shut down.

> (Source : [Wikipedia](https://en.wikipedia.org/wiki/Runit))


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) What's in this image

This image is built on top of  [dsuite/alpine-base][alpine-base] container and integrate [runit][runit] as a process supervisor.

This image can easily be used as a replacement of any Alpine image which would include supervisor or any other process management.


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) Environment variables

A full list of [dsuite/alpine-base environment variables][alpine-base-readme-variables] are described in the [alpine-base Readme][alpine-base-readme].

Change the current user, set the timezone, use your own startup scripts, ...  and much more.


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) How to use it

Add your initialisation scripts in: `/etc/runit/init.d`  
Add your shutdown scripts in: `/etc/runit/finish.d`  
Any services should be placed in: `/etc/service.d/` (with run and finish script)  
Create the file enable in /etc/service.d/MyService/ to enable the service at startup: `touch /etc/service.d/MyService/enable`.  
Create the file disable in /etc/service.d/MyService/ to disable the service at startup: `touch /etc/service.d/MyService/disable`.  
Disabling a service is predominante over enabling it.

Run it: `docker run -it -d --name=runit dsuite/alpine-runit`

Get an sh command prompt inside the container and play with your services:

```bash
docker exec -it runit sh

# Get help
runit help
# List installed services
runit list
# Enable a service
runit service MyService enable
# Disable a service
runit service MyService disable
# Start a service
runit service MyService start
# Stop a service
runit service MyService stop
# Restart a service
runit service MyService restart
# Status of the service
runit service MyService status

# Stop the container
runit stop
```


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) An example

Have a look at the [example folder](https://github.com/docker-suite/alpine-runit/tree/master/.example). You'll find out how to create an image based on [dsuite/alpine-runit][alpine-runit]

This example image contains:
- An initialisation scripts: `/etc/runit/init.d/00-echo.sh`  
- A shutdown scripts: `/etc/runit/finish.d/00-echo.sh`  
- A service named log-service:  `/etc/runit/service.d/log-service` (with run and finish script)
- A service named main-service:  `/etc/runit/service.d/main-service` (with run and finish script) 
- A service named test-service:  `/etc/runit/service.d/test-serviceservice` (with run script)  


## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) Credits
Inspired from [runitshover](https://github.com/HowardMei/runitshover) and others runit images found on GitHub.

[alpine]: http://alpinelinux.org/
[runit]: http://smarden.org/runit/
[alpine-base]: https://github.com/docker-suite/alpine-base/
[alpine-base-readme]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md/
[alpine-base-readme-variables]: https://github.com/docker-suite/alpine-base/blob/master/Readme.md#-environment-variables
[alpine-runit]: https://github.com/docker-suite/alpine-runit/
