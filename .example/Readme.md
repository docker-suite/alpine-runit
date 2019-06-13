# ![](https://github.com/docker-suite/artwork/raw/master/logo/png/logo_32.png) alpine-runit example

This is a simple example to illustrate how to use dsuite/alpine-runit

## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) What's in this image

This example inlcude 3 services:  
```log-service```: a fake service which restart when it crash  
```main-service```: a fake service which stop the container when it crash  
```test-service```: an other fake service to play with  

Only ```log-service``` and ```main-service``` are enable at startup.

## ![](https://github.com/docker-suite/artwork/raw/master/various/pin/png/pin_16.png) How to use it

Build ```docker build -t alpine-runit:example .```  
Run ```docker run -it --rm --name=runit-example alpine-runit:example```

Get a bash command prompt inside the container and play with the services:

```bash
docker exec -it runit-example bash

# Get help
runit help
# List installed services
runit list
# Enable a service
runit service MyService enable
# Disable a service
runit service MyService disable

# Enable test-service
runit service test-service enable
# Stop a service
runit service test-service stop
# Start test-service
runit service test-service start
# Restart a service
runit service test-service restart
# Status of the service
runit service test-service status

# Stop the container
runit stop
```

[alpine]: http://alpinelinux.org/
[runit]: http://smarden.org/runit/
