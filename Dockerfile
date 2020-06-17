FROM lsiobase/ubuntu:bionic

LABEL maintainer="lazydays79"

ARG UNIFI_VIDEO_VERSION=v3.10.12

RUN \
   echo "**** install packages ****" && \
   apt-get update && \
   apt-get install -y \
       mongodb \
       mongodb-server \
       openjdk-8-jre-headless \
       jsvc && \
    echo "**** install unifi video ****" && \
    curl -o \
         /tmp/unifi-video.deb -L \
	    "https://dl.ui.com/firmwares/ufv/${UNIFI_VIDEO_VERSION}/unifi-video.Ubuntu18.04_amd64.${UNIFI_VIDEO_VERSION}.deb" && \
    dpkg -i /tmp/unifi-video.deb && \
    echo "**** cleanup ****" && \
    apt-get clean && \
    rm -rf \
	    /tmp/* \
	    /var/lib/apt/lists/* \
	    /var/tmp/* && \
    echo "**** finished ****"

WORKDIR /usr/lib/unifi-video

VOLUME /config

EXPOSE 7080 7443 7445 7446 7447 10001


