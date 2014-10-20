FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN yaourt -S --noconfirm wget python2-pillow libselinux && pacman -Scc --noconfirm
RUN useradd -u 500 seafile
WORKDIR /opt
#RUN wget https://bitbucket.org/haiwen/seafile/downloads/seafile-server_3.1.7_x86-64.tar.gz
#RUN tar xvzf seafile-server*_x86-64.tar.gz

EXPOSE 8082 10001 12001
 


