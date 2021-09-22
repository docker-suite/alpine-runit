FROM dsuite/alpine-runit

COPY rootfs /

RUN \
	set -x \
    && apk-upgrade \
	&& apk-cleanup
