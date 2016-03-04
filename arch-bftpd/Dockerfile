FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -Sy --noconfirm bftpd && pacman -Scc --noconfirm

VOLUME ["/srv/ftp", "/bftpd" ]

CMD bftpd -D -c /bftpd/bftpd.conf
