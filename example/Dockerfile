FROM craftdock/alpine-runit

ENV LOGGER=false

COPY ./rootfs /

RUN \
	set -x \
    && apk-upgrade \
	&& apk-cleanup
