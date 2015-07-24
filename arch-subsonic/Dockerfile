FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN yaourt -S --noconfirm jdk7
RUN yaourt -S --noconfirm subsonic-kang ffmpeg flac lame && pacman -Scc --noconfirm

RUN mkdir -p /Data /var/subsonic/transcode
RUN ln -s $(which ffmpeg) /var/subsonic/transcode/ffmpeg
RUN ln -s $(which flac) /var/subsonic/transcode/flac
RUN ln -s $(which lame) /var/subsonic/transcode/lame
RUN useradd -m -u 3456 subsonic
RUN chown -R subsonic: /var/subsonic


EXPOSE 4040
VOLUME ["/var/subsonic/db", "/Data"]

WORKDIR /var/subsonic
CMD java -jar subsonic-booter-jar-with-dependencies.jar
CMD su -s /bin/bash -c 'LANG=en_US.UTF-8 java -jar subsonic-booter-jar-with-dependencies.jar' subsonic
