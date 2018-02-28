# alpine-runit

runit is an init scheme for Unix-like operating systems that initializes, supervises, and ends processes throughout the operating system.Runit is a reimplementation of the daemontools process supervision toolkit that runs on the Linux, Mac OS X, *BSD, and Solaris operating systems. Runit features parallelization of the start up of system services, which can speed up the boot time of the operating system.

Runit is an init daemon, so it is the direct or indirect ancestor of all other processes. It is the first process started during booting, and continues running until the system is shut down.

(Source : [Wikipedia](https://en.wikipedia.org/wiki/Runit))

## What's in this image

This image is built on top of the latest [Alpine container][alpine-base] and integrate [runit][runit] as a process supervisor.

This image can easly be used as a replacement of any Alpine which would include supervisor or any other process management.


## How to use it

Add your initialisation scripts in: `/etc/runit/init.d`  
Add your shutdown scripts in: `/etc/runit/finish.d`  
Any services should be placed in: `/etc/service.d/` (with run and finish script)  
Create the file enable in /etc/service.d/MyService/ to enable the service at startup: `touch /etc/service.d/MyService/enable`.  
Create the file disable in /etc/service.d/MyService/ to disable the service at startup: `touch /etc/service.d/MyService/disable`.  
Disabling a service is predominante over enabling it.

Run it: `docker run -it -d --name=runit craftdock/alpine-runit`

Get an sh command prompt inside the container and play with your services:

```powershell
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

## A cron service

A cron service is included, however it is not enable by default.  
To enable if, just create the file enable in /etc/service.d/cron : `touch /etc/service.d/cron/enable`  
Add your cron file into /etc/crontabs and it will automatically be added to /etc/crontabs/root  
An example can be found in the [example folder](https://github.com/CraftDock/alpine-runit/tree/master/example).


## An example

Have a look at the [example folder](https://github.com/CraftDock/alpine-runit/tree/master/example). You'll find out how to create an image based on craftdock/alpine-runit

This example image contains:
- An initialisation scripts: `/etc/runit/init.d/00-echo.sh`  
- A shutdown scripts: `/etc/runit/finish.d/00-echo.sh`  
- A service named log-service:  `/etc/runit/service.d/log-service` (with run and finish script)
- A service named main-service:  `/etc/runit/service.d/main-service` (with run and finish script) 
- A service named test-service:  `/etc/runit/service.d/test-serviceservice` (with run script)  
- A crontab:  `/etc/crontabs/echo-test`    

## Credits
Inspired from [runitshover](https://github.com/HowardMei/runitshover) and others runit images found on GitHub.


[alpine]: http://alpinelinux.org/
[runit]: http://smarden.org/runit/
[alpine-base]: https://hub.docker.com/r/craftdock/alpine-base/
