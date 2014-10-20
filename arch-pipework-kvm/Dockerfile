FROM n0rad/arch-pipework
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm qemu && pacman -Scc --noconfirm


RUN mkdir /srv/vm
ADD start.sh /opt/start.sh
#ENTRYPOINT ["/opt/start.sh"]
