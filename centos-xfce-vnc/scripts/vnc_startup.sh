#!/bin/bash

#@wjw delete vnc tmp files
rm -f /tmp/.X1-lock
rm -f /tmp/.X11-unix/X1

#resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}

##change vnc password
echo "change vnc password!"
(echo $VNC_PW && echo $VNC_PW) | vncpasswd

##start vncserver
vncserver -kill :1 && rm -rfv /tmp/.X* ; echo "remove old vnc locks to be a reattachable container"
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION
/etc/xdg/xfce4/xinitrc &
sleep 1

##log connect options
echo -e "\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"

#@wjw start panel&ibus
xfce4-panel &
ibus-daemon --xim &

for i in "$@"
do
case $i in
    # if option `-t` or `--tail-log` block the execution and tail the VNC log
    -t|--tail-log)
    echo -e "\n------------------ /root/.vnc/*$DISPLAY.log ------------------"
    tail -f /root/.vnc/*$DISPLAY.log
    ;;
    *)
    # unknown option ==> call command
    exec $i
    ;;
esac
done
