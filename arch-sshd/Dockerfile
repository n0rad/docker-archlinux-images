FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>


RUN pacman -S --noconfirm openssh
RUN /usr/bin/ssh-keygen -A
RUN echo 'root:roottoor' | chpasswd


ADD ./sshd.ini /etc/supervisor.d/sshd.ini



# Fix sshd
RUN sed -i -e 's/^UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config


EXPOSE	 22
CMD ["/usr/bin/supervisord"]
