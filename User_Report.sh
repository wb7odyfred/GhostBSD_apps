#!/bin/sh
## /bin/sh User_Report.sh  > Report_$(hostname)_$(date +%F) && /bin/sh gzip -fk Report_$(hostname)_$(date +%F)
## for /usr/local/bin/fish default shell use the line below
## /bin/sh User_Report.sh  > Report_(hostname)_(date +%F) && gzip -fk Report_(hostname)_(date +%F)
## original idea from   https://revadig.blogspot.com/2019/09/freebsd-workstation-user-report.html 






#!/bin/sh
# GhostBSD Workstation user report placed in configuration file and gzipped
#
# Section dividers
DEV1=" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #\n #############################################################\n"
DEV2=" #############################################################\n # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #"
#
# File name dividers
SEP1="\n\n\n# ------------------------------------------------------------- \n\n\t"
SEP2="\n\n# ------------------------------------------------------------- \n\n\n"
#
LIN1="\n # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #\n"
LIN2=' # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #\n\n'
#
FL='\n\n\n\n'
#
printf "\t####  GhostBSD  OS  &  WORKSTATION  INFO  ####\n" 
printf "\n\t\t$(date)\n\n"
printf "$LIN1"
echo ' Hostname: ' $(hostname -s)  '       Domain: ' $(hostname -d)
echo ' Network : ' $(ifconfig |  grep 192.168.*)
echo ' Gateway enable: ' $(grep gateway_e /etc/rc.conf)
echo ' Defaultrouter : ' $(grep defaultrouter /etc/rc.conf)
echo ' DNS Server: ' $(less /etc/resolv.conf)
printf "$LIN2"
printf "$LIN1"
echo ' Which user:   $ USER: '  $(echo $USER)  '   whoami: ' $(whoami)    '   $ LOGNAME: ' $LOGNAME 
printf "$LIN2"
printf "$LIN1"
printf ' GhostBSD - Ghostbsd-version utility\n Version and patch level of the installed system' 
printf "$LIN1"
echo ' - Installed kernel : ' $(freebsd-version -k)
echo ' - Running kernel :   ' $(freebsd-version -r)
echo ' - Userland :         ' $(freebsd-version -u)   
printf "$LIN2"
printf "$LIN1"
printf ' GhostBSD - uname command - Information about the system'
printf "$LIN1"
echo ' - Kernel ident : ' $(uname -i)
echo ' - Kernel version : ' $(uname -K) 
echo ' - Hardware platform : ' $(uname -m) 
echo ' - Name of the system: ' $(uname -n) 
echo ' - Machine processor architecture : ' $(uname -p)
echo ' - Release level of the OS : ' $(uname -r) 
echo ' - Name of the OS implementation: ' $(uname -s) 
echo ' - GhostBSD version of the user environment : ' $(uname -U)
echo ' - Version level of this release of the OS :' 
echo ' '$(uname -v)  | fold -s
printf "$LIN2"
printf "$LIN1"
printf '\t\t\tCPU Info'
printf "$LIN1"
#
cat /var/run/dmesg.boot | grep --after-context=6 ^CPU | fold -s -w 72
printf "$LIN2"
printf "$LIN1"
printf '  \t\t Memory usage'
printf "$LIN1"
top -S -osize -d1
printf "$LIN2"
printf "$LIN1"
printf '\t\t\tSETTINGS'
printf "$LIN1"
printf ' - SECT01 : CONFIGURATION:\n/boot/loader.conf /etc/rc.conf /etc/pf.conf /etc/fstab /etc/sysctl.conf /etc/rc.local /etc/rc.d/local
\n - SECT02 : OpenSSH SETTING:\n/etc/ssh/ssh_config  /etc/ssh/sshd_config 
\n - SECT03 : NETWORK SETTING:\nifconfig /etc/resolv.conf /var/unbound/unbound.conf /etc/ppp/ppp.conf /etc/wpa_supplicant.conf
\n - SECT04 : APPLICATIONS & INSTALLED PACKAGES
\n - SECT05 : PERSONAL SETTING:\n~/.bashrc ~/.bash_aliases ~/.bash_history ~/.cshrc ~/.shrc  ~/.history  ~/.profile ~/.xsession ~/.xinitrc ~/.Xdefaults ~/.xpdfrc ~/.vimrc ~/.tmux.conf ~/.xbindkeysrc ~/.lynx.cfg ~/.elinks/elinks.conf ~/.links/links.cfg ~/.links/html.cfg
\n - SECT06 : X11 SETTING:\n' | fold -s 
readlink -f  /usr/local/etc/X11/xorg.conf.d/*
printf '\n - SECT07 : BOOT dmesg: /var/run/dmesg.boot
\n - SECT08 : FILE PERMISSION \n - SECT09: FILES OPENRC '
printf "$LIN1"
printf "$FL"
#
printf "$DEV1"
printf ' SECT01 - CONFIGURATION\n'
printf "$DEV2"
printf "$FL"
printf "$LIN1"
printf ' /boot/loader.conf :\n'
printf "$LIN2"
cat /boot/loader.conf 
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/rc.conf :\n'
printf "$LIN2"
cat /etc/rc.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/pf.conf :\n'
printf "$LIN2"
cat /etc/pf.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/fstab :\n'
printf "$LIN2"
cat /etc/fstab
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/sysctl.conf :\n'
printf "$LIN2"
cat /etc/sysctl.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/rc.local :\n'
printf "$LIN2"
cat /etc/rc.local
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/rc.d/local :\n'
printf "$LIN2"
cat /etc/rc.d/local
printf "$LIN1"
printf "$FL"
#
printf "$DEV1"
printf ' SECT02 - OpenSSH SETTING\n'
printf "$DEV2"
printf "$FL"
printf "$LIN1"
printf ' /etc/ssh/ssh_config :\n'
printf "$LIN2"
cat /etc/ssh/ssh_config
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/ssh/sshd_config :\n'
printf "$LIN2"
cat /etc/ssh/sshd_config
printf "$LIN1"
printf "$FL"
#
printf "$DEV1"
printf ' SECT03 - NETWORK SETTING\n'
printf "$DEV2"
printf "$FL"
printf "$LIN1"
printf ' ifconfig :\n'
printf "$LIN2"
ifconfig
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/resolv.conf :\n'
printf "$LIN2"
cat /etc/resolv.conf 
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /var/unbound/unbound.conf :\n'
printf "$LIN2"
cat /var/unbound/unbound.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/ppp/ppp.conf  :\n'
printf "$LIN2"
cat /etc/ppp/ppp.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/wpa_supplicant.conf  :\n'
printf "$LIN2"
cat /etc/wpa_supplicant.conf
printf "$LIN1"
printf "$FL"
#
printf "$DEV1"
printf ' SECT04 - APPLICATIONS & INSTALLED PACKAGES\n'
printf "$DEV2"
printf "$FL"
echo '  Applications' 
printf "$LIN1"
pkg leaf
printf "$LIN2"
printf "$FL"
echo  '  All installed packages'
printf "$LIN1"
pkg info -a
printf "$LIN2"
printf "$FL"
#
printf "$DEV1"
printf ' SECT05 - PERSONAL SETTING\n'
printf "$DEV2"
for i in $(readlink -f ~/.*shr* ~/.*sh_*) ; do printf "$FL $LIN1 $i $LIN1 $FL"  && cat "$i" ; done
printf "$FL"
printf "$LIN1"
printf ' ~/.history :\n'
printf "$LIN2"
cat  ~/.history
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.profile :\n'
printf "$LIN2"
cat  ~/.profile
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.xsession :\n'
printf "$LIN2"
cat ~/.xsession
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.xinitrc :\n'
printf "$LIN2"
cat ~/.xinitrc
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.Xdefaults :\n'
printf "$LIN2"
cat  ~/.Xdefaults
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.xpdfrc :\n'
printf "$LIN2"
cat ~/.xpdfrc
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.vimrc :\n'
printf "$LIN2"
cat ~/.vimrc
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.tmux.conf :\n'
printf "$LIN2"
cat ~/.tmux.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~./xbindkeysrc :\n'
printf "$LIN2"
cat ~/.xbindkeysrc
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.lynx.cfg :\n'
printf "$LIN2"
cat ~/.lynx.cfg
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.elinks/elinks.conf :\n'
printf "$LIN2"
cat ~/.elinks/elinks.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.links/links.cfg :\n'
printf "$LIN2"
cat ~/.links/links.cfg
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' ~/.links/html.cfg :\n'
printf "$LIN1"
cat ~/.links/html.cfg
printf "$LIN1"
printf "$FL"
#
printf "$DEV1"
printf ' SECT06 - X11 SETTING\n'
printf "$DEV2"
printf "$FL"
readlink -f  /usr/local/etc/X11/xorg.conf.d/*
printf "$FL"
for i in $(readlink -f /usr/local/etc/X11/xorg.conf.d/*) ; do printf '\n\n# - - - - - - - - - - - - -\n\n' && cat "$i" ; done
printf "$FL"
#
printf "$DEV1"
printf ' SECT07 - BOOT dmesg\n'
printf "$DEV2"
printf "$FL"
printf "$LIN1"
cat /var/run/dmesg.boot
printf "$LIN2"
printf "$FL"
#
printf "$DEV1"
printf ' SECT08 - FILE PERMISSION\n'
printf "$DEV2"
printf "$FL"
printf "$LIN1"
printf ' CONFIGURATION - FILE PERMISSION:\n'
printf "$LIN2"
ls -l /boot/loader.conf  /etc/rc.conf   /etc/pf.conf   /etc/fstab   /etc/sysctl.conf   /etc/rc.local  /etc/rc.d/local  /etc/openrc /etc/openrc.shutdown
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' OpenSSH SETTING - FILE PERMISSION:\n'
printf "$LIN2"
ls -l /etc/ssh/
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' Network SETTING - FILE PERMISSION:\n'
printf "$LIN2"
ls -l /etc/resolv.conf /var/unbound/  /etc/ppp/  /etc/wpa_supplicant.conf
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' X11 SETTING - FILE PERMISSION:\n'
printf "$LIN2"
for i in $(readlink -f /usr/local/etc/X11/*) ; do ls -l "$i" ; done
printf "$LIN1"
printf "$FL"
#
printf "$DEV1"
printf ' SECT09 - FILE OPENRC\n'
printf "$DEV2"
printf "$FL"
printf "$LIN1"
printf ' OPENRC - FILE PERMISSION:\n'
printf "$LIN2"
for i in $(readlink -f /etc/openrc*) ; do ls -l "$i" ; done
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' OpenRC - FILE Contents:\n'
printf "$LIN2"
printf "$LIN1"
printf ' /etc/openrc  :\n'
printf "$LIN2"
cat /etc/openrc
printf "$LIN1"
printf "$FL"
printf "$LIN1"
printf ' /etc/openrc.shutdown  :\n'
printf "$LIN2"
cat /etc/openrc.shutdown
printf "$LIN1"
printf "$FL"
printf "\n$(date)\n\nEOF"
printf "$FL"

