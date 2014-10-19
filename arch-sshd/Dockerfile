FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm openssh && pacman -Scc --noconfirm
RUN /usr/bin/ssh-keygen -A

# Fix sshd
RUN sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

ADD start.sh /opt/start.sh

VOLUME ["/home/"]
EXPOSE	 22
ENTRYPOINT ["/opt/start.sh"]
CMD ["user", "1000"]
