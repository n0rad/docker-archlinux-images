FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -S --noconfirm wget && pacman -Scc --noconfirm

RUN wget --no-check-certificate https://raw.github.com/jpetazzo/pipework/master/pipework
RUN chmod +x pipework

