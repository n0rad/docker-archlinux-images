FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>


RUN yaourt -S --noconfirm subsonic-kang && pacman -Scc --noconfirm

EXPOSE 4040
RUN mkdir -p /Data
RUN useradd -m -u 3456 subsonic
RUN chown -R subsonic: /var/subsonic

VOLUME ["/var/subsonic/db", "/Data"]

WORKDIR /var/subsonic
CMD java -jar subsonic-booter-jar-with-dependencies.jar
CMD su -s /bin/bash -c 'java -jar subsonic-booter-jar-with-dependencies.jar' subsonic
