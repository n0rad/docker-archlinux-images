FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>


RUN yaourt -S --noconfirm plex-media-server && pacman -Scc --noconfirm

EXPOSE 32400
RUN mkdir -p /Data
RUN chown -R plex: /var/lib/plex
VOLUME ["/var/lib/plex", "/Data"]

WORKDIR /opt/plexmediaserver
CMD su -s /bin/bash -c 'rm -rf /var/run/* &&\
  rm -f "/var/lib/plex/Library/Application Support/Plex Media Server/plexmediaserver.pid" &&\
  /opt/plexmediaserver/start.sh' plex
