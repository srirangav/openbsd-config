# .xsession
# based on:
#    https://dataswamp.org/~solene/2021-05-03-openbsd-getting-started.html
#    https://nechtan.io/articles/openbsd_minimalist_desktop.html
#    https://github.com/jcs/dotfiles/blob/master/.xsession

# exported environment variables

# better two-finger touchpad scrolling, opengl acceleration,
# enable webrender in firefox

MOZ_USE_XINPUT2=1
MOZ_ACCELERATED=1
MOZ_WEBRENDER=1
export MOZ_USE_XINPUT2 MOZ_ACCELERATED MOZ_WEBRENDER

# try to increase the cursor size

XCURSOR_SIZE=48
export XCURSOR_SIZE

# HIDPI

HIDPI=1
GDK_SCALE=1.5
QT_SCALE_FACTOR=1.5
export HIDPI GDK_SCALE QT_SCALE_FACTOR

# local variables

x11prefix="/usr/X11R6"
x11exec_prefix="${x11prefix}/bin"
localprefix="/usr/local"
localexec_prefix="${localprefix}/bin"

# cleanup function for when X11 exits

cleanup() {
    pkill picom
    /bin/rm -f ~/.Xauthority
}

trap cleanup INT TERM QUIT

# No core dumps!

ulimit -Sc 0

# load X11 settings

${x11exec_prefix}/xrdb  -DHIDPI=1 -DHOME=$HOME -merge ~/.Xresources
${x11exec_prefix}/xmodmap ~/.xmodmap

# uncomment to fix scaling of some X/QT Programs
# see: https://marc.info/?l=openbsd-tech&m=163674121630769&w=2

#${x11exec_prefix}/xrandr --dpi 96

# turn off the bell

${x11exec_prefix}/xset b off

# set the screen temperature

${localexec_prefix}/sct 4800

# sync clipboard

${localexec_prefix}/autocutsel &

# disable the builtin screensaver and use xidel to autolock 
# the display after 5 mins

xset s off
${x11exec_prefix}/xidle -no -program "${x11exec_prefix}/xlock -mode blank" -timeout 300 &

# start picom for faster window drawing and shadows

${localexec_prefix}/picom -b -c &

# start a terminal 

#/usr/X11R6/bin/xterm -bg black -fg green &
${localexec_prefix}/mate-terminal &

# uncomment to start some window maker utilities 

#${localexec_prefix}/wmCalClock &
#${localexec_prefix}/wmapm &
#${localexec_prefix}/wmmon &

# start WindowMaker as our window manager and block

${localexec_prefix}/wmaker

# cleanup when WindowMaker exits

cleanup

