# GhostBSD_apps
my little app projects for GhostBSD Application development

User_Report.py User_Report.sh Generate_User_Report.desktop  applets-screenshooter.png  are used to collect the configuration data from the GhostBSD Operating System for sharing with another user for "help purposes"   A method to make a GUI app for a new GhostBSD user to get help with configuration and driver problems.   A simple app for a GUI user to click a button.

Sample Icon highcolor/48x48/applets-screenshooter.png   This is just a sample icon to make the .desktop file work
Generate_User_Report.desktop   The Gnome .desktop file for the clickable desktop ICON to start the User_Report.py report
Report_fred-ghostbsd-pc1_2020-04-05   A sample output file, that collects all the configuration data in one file to report computer status
User_Report.py   a python program to  run the shell script User_Report.sh  
User_Report.sh   The orginal FreeBSD shell script taken from blog  https://revadig.blogspot.com/2019/09/freebsd-workstation-user-report.html

#!/bin/sh
# User_report.sh  > Report_$(hostname)_$(date +%F) && gzip Report_$(hostname)_$(date +%F)
