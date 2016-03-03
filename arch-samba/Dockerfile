FROM n0rad/arch
MAINTAINER n0rad <alemaire@norad.fr>

RUN pacman -Sy --noconfirm samba && pacman -Scc --noconfirm

#ADD ./smb.conf /etc/samba/smb.conf
#RUN useradd smbuser
#RUN printf "password\npassword\n" | pdbedit -t -a -u smbuser

VOLUME ["/data", "/var/lib/samba"]

CMD smbd -i -F & \
 nmbd -i -F
