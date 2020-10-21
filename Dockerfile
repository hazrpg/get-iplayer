FROM lsiobase/xenial
MAINTAINER Poag

#Setup Repos
RUN \
    apt update && \
    apt-get install -y software-properties-common python-software-properties

# install packages
RUN \
    apt-get update && \
    apt-get install -y wget

# install latest version
RUN \
    wget "https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer" && \
    install -m 755 ./get_iplayer /usr/bin

RUN \
    wget "https://raw.githubusercontent.com/get-iplayer/get_iplayer/master/get_iplayer.cgi" && \
    install -m 755 ./get_iplayer.cgi /usr/bin

# cleanup
RUN \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

# ports and volumes
EXPOSE 1935
VOLUME /config /data

COPY root/ /root/

CMD ["/bin/bash", "/root/start.sh"]
