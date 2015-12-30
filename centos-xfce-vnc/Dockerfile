# This Dockerfile is used to build an sakuli image based on Centos

FROM centos:7.2.1511

MAINTAINER wjw465150 "wjw465150@gmail.com"
ENV REFRESHED_AT 2015-12-18

ENV DISPLAY :1
ENV VNC_COL_DEPTH 24
ENV VNC_RESOLUTION 1280x1024
ENV VNC_PW vncpassword

############### xvnc / xfce installation
RUN yum -y install epel-release; yum clean all
RUN yum -y update; yum clean all
RUN yum --enablerepo=epel -y -x gnome-keyring --skip-broken groups install "Xfce"
RUN yum -y groups install "Fonts"
RUN yum -y install tigervnc-server wget net-tools unzip firefox

### install chinese  suport###
RUN echo 'LANG="zh_CN.UTF-8"' > /etc/locale.conf
RUN yum -y install sudo bzip2 openssh-clients gedit ibus ibus-libpinyin ibus-gtk2 ibus-gtk3 im-chooser gtk2-immodule-xim gtk3-immodule-xim

# xvnc server porst, if $DISPLAY=:1 port will be 5901
EXPOSE 5901

ADD .vnc /root/.vnc
ADD .config /root/.config
ADD Desktop /root/Desktop
ADD scripts /root/scripts
RUN chmod +x  /root/scripts/*.sh /root/.vnc/xstartup /etc/xdg/xfce4/xinitrc /root/Desktop/*.desktop
RUN /bin/dbus-uuidgen > /etc/machine-id

ENTRYPOINT ["/root/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
