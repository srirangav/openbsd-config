# .xsession
# based on: https://dataswamp.org/~solene/2021-05-03-openbsd-getting-started.html

x11prefix="/usr/X11R6"
x11exec_prefix="${x11prefix}/bin"
localprefix="/usr/local"
localexec_prefix="${localprefix}/bin"

# try to increase the cursor size

XCURSOR_SIZE=48
export XCURSOR_SIZE

# load X11 settings

${x11exec_prefix}/xrdb -merge ~/.Xresources
${x11exec_prefix}/xmodmap ~/.xmodmap

# turn off the bell

${x11exec_prefix}/xset b off

# set the screen temperature

${localexec_prefix}/sct 4800

# sync clipboard

${localexec_prefix}/autocutsel &

# enable autolocking of the display after 5 mins

${x11exec_prefix}/xidle -no -program "${x11exec_prefix}/xlock -mode blank" -timeout 300 &

# start a compositor for faster window drawing

${localexec_prefix}/picom &

# start a terminal 

#/usr/X11R6/bin/xterm -bg black -fg green &
${localexec_prefix}/mate-terminal &

# start some window maker utilities 

${localexec_prefix}/wmCalClock &
#${localexec_prefix}/wmapm &
#${localexec_prefix}/wmmon &

# start the window manager

exec ${localexec_prefix}/wmaker
