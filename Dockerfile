FROM lsiobase/mono.armhf:xenial

LABEL maintainer="Ferg@lMoran.me"

ARG DEBIAN_FRONTEND="noninteractive"
ENV XDG_CONFIG_HOME="/config/xdg"

RUN \
 apt-get update && apt-get install apt-transport-https
RUN \
 echo "**** add sonarr repository ****" && \
 apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 2A9B4BF8 && \
 echo "deb https://dl.bintray.com/sonarr/phantom wheezy main" | tee /etc/apt/sources.list.d/sonarr.list
RUN \
 echo "**** install packages ****" && \
 apt-get update && \
 apt-get install -y \
	sonarr && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

EXPOSE 8989
VOLUME /config /downloads /tv
ADD ./scripts/start.sh /

ENTRYPOINT ["sh", "start.sh"]
