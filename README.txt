OpenBSD Configuration
---------------------

These are some configuration files from my OpenBSD 7.1 systems.

blocklist      - Makefile to create blocklists for unwind(8) and pf(4)
etc            - customized config files from /etc
home           - customized config files from $HOME
notes          - notes about OpenBSD

Helpful Links
-------------

1. Install / Post Install:

   https://www.openbsd.org/faq/faq4.html
   https://dataswamp.org/~solene/2021-02-14-openbsd-default-security.html

   Remove google from ntpd.conf:

   https://github.com/lea2501/guides/blob/main/openbsd_guide_install-post_install-ntpd_remove_google_check.md

2. Drives

   Encrypting External Drives
   
   https://github.com/lea2501/guides/blob/main/openbsd_guide_bioctl.md

   Mounting USB Drives:

   https://www.tumfatig.net/2011/automount-usb-stick-on-openbsd/
   https://www.cyberciti.biz/faq/openbsd-mounting-usb-flash-drive-harddisk/

3. Virtualization

   vmm(4):

   https://www.openbsd.org/faq/faq16.html
   https://www.h-i-r.net/2018/12/openbsd-vmm-hypervisor-part-4-running.html
   https://icyphox.sh/blog/signal-vmm/

   qemu:

   https://astro-gr.org/openbsd-qemu/
   https://www.reddit.com/r/openbsd/comments/i7i9m2/openbsd_not_allowing_qemu_to_have_more_than_1g_of/

   sshfs (once sshfs-fuse is installed):

   $ doas sshfs -o idmap=user,allow_other,uid="`id -u`",gid="`id -g`" \
          [user]@[host]:[remote dir] [local dir]

   See: https://dataswamp.org/~solene/2022-07-23-openbsd-sshfs.html

4. Music

   Siren (Console Music Player):

   https://www.kariliq.nl/man/siren.1.html
   https://www.linuxlinks.com/siren-text-based-audio-player/2/

   CDs/DVDs/ISOs:

   https://daemonforums.org/showthread.php?t=6560
   https://help.ubuntu.com/community/CDRipping
   https://linuxconfig.org/how-to-rip-an-audio-cd-from-the-command-line-using-cdparanoia
   https://github.com/lea2501/guides/blob/main/openbsd_mount.md

5. PDF / Image Viewers / Editors

   https://github.com/phillipberndt/pqiv
   https://www.geeqie.org/
   https://www.pinta-project.com/
   https://www.tumfatig.net/2021/annotate-your-pdf-files-on-openbsd/

6. Printing

   https://ffuentes.sdf.org/unix/2021/06/10/printing-in-openbsd.html
   https://paedubucher.ch/articles/2020-09-20-basic-printing-on-openbsd.html

7. pf

   https://www.openbsdhandbook.com/pf/cheat_sheet/
   https://github.com/muktadiur/blockor

8. X11

   Reconfigure Keys:

   https://askubuntu.com/questions/39462/
   https://github.com/philc/vimium

   Windowmaker:

   https://www.windowmaker.org/docs/installation.html
   https://www.tumfatig.net/2019/an-openbsd-desktop-using-windowmaker/

   Login Screen:

   https://www.tumfatig.net/2019/customizing-openbsd-xenodm/

   Wallpaper:

   https://github.com/krzysztofengineer/openbsd/blob/master/dwm/03-wallpaper.md

9. Other

   Sound: 

      https://github.com/krzysztofengineer/openbsd/blob/master/configuration/03-sound.md

   Screenshots:

       https://github.com/krzysztofengineer/openbsd/blob/master/dwm/05-screenshots.md

   HDMI Mirroring: 

       https://github.com/krzysztofengineer/openbsd/blob/master/tasks/03-hdmi.md

   mimeapps.list:  

       https://gist.github.com/professorjamesmoriarty/6087174

