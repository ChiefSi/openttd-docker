FROM debian:11

RUN apt-get update -y && apt-get install -y \
	xz-utils unzip libsdl-sound1.2 libsdl-mixer1.2 xserver-xorg

RUN mkdir working

COPY opengfx-7.1-all.zip /working
COPY openmsx-0.4.2-all.zip /working
COPY opensfx-1.0.3-all.zip /working
COPY openttd-13.3-linux-generic-amd64.tar.xz /working

RUN cd / && \
	tar -xf /working/openttd-13.3-linux-generic-amd64.tar.xz && \
	ln -sf /openttd-13.3-linux-generic-amd64/ /openttd && \
	cd /openttd/baseset && \
	unzip -p /working/opengfx-7.1-all.zip | tar -x && \
	unzip -p /working/openmsx-0.4.2-all.zip | tar -x && \
	unzip -p /working/opensfx-1.0.3-all.zip | tar -x && \
	rm -rf /working
