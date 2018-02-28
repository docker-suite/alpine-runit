FROM craftdock/alpine-base:latest

LABEL maintainer="Hexosse <hexosse@gmail.com>" \
      description="Alpine runit process supervisor."

# When LOGGER is true, all outputs will be redirected to a log file
ENV LOGGER=false

RUN \
	# Print executed commands
	set -x \
    # Update repository indexes
    && apk update \
    # Download the install script and run it
    && apk add curl \
    && curl -s -o /tmp/install-runit.sh https://raw.githubusercontent.com/craftdock/Install-Scripts/master/alpine-runit/install-runit.sh \
    && sh /tmp/install-runit.sh \
	# Clear apk's cache
	&& apk-cleanup

# Define the entrypoint
ENTRYPOINT ["/entrypoint"]

# Start runit
CMD ["start"]
