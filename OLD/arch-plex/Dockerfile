# plex
FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>


RUN yaourt -S --noconfirm plexmediaserver && pacman -Scc --noconfirm



EXPOSE 32400
ADD ./plex.ini /etc/supervisor.d/plex.ini
VOLUME ["/var/log/supervisor"]
CMD ["/usr/bin/supervisord"]

