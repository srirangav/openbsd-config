# .xsession
# Based on: https://dataswamp.org/~solene/2021-05-03-openbsd-getting-started.html

XCURSOR_SIZE=48
export XCURSOR_SIZE

# load X11 settings

/usr/X11R6/bin/xrdb -merge ~/.Xresources
/usr/X11R6/bin/xmodmap ~/.xmodmap

# set the screen temperature

/usr/local/bin/sct 4800

# sync clipboard

/usr/local/bin/autocutsel &

# enable autolocking of the display after 5 mins

/usr/X11R6/bin/xidle -no -program "/usr/X11R6/bin/xlock -mode blank" -timeout 300 &

# start a compositor for faster window drawing

#/usr/local/bin/picom &

# start a terminal 

#/usr/X11R6/bin/xterm -bg black -fg green &
#/usr/local/bin/xfce4-terminal &
/usr/local/bin/mate-terminal &

# start some window maker utilities 

/usr/local/bin/wmCalClock &
/usr/local/bin/wmmom &

# start windowmaker 

exec /usr/local/bin/wmaker
