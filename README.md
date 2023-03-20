# GhostBSD_apps
Fred's  little app projects for GhostBSD Application development

These 4 files: User_Report.py User_Report.sh Generate_User_Report.desktop  applets-screenshooter.png  are used to collect the configuration data from the GhostBSD Operating System for sharing with another user for "help purposes"   A method to make a GUI app for a new GhostBSD user to get help with configuration and driver problems.   This simple app allows a new GHOSTBSD desktop GUI user to click a button and create a comprehensive computer configuration file that is gzipped to a small size for sharing via Telegram t.me/GhostBSD or email.   This comprehensize computer configuration file contains most of the information to diagnose the users computer problem from a more experienced users point of view.  This file eliminates many requests for just a little more information (ie one more item that was not already requested).

Sample Icon highcolor/48x48/applets-screenshooter.png   Clicking on this sample icon,  makes the .desktop file 
"Generate_User_Report.desktop" execute the command "python User_Report.py"   
User_Report.py is a GUI application to execute the command line 
"/bin/sh /usr/share/generate_user_report/User_Report.sh   > Report_$(hostname)_$(date +%F) && gzip Report_$(hostname)_$(date +%F)"

The Gnome .desktop file (Generate_User_Report.desktop) for the clickable desktop ICON file (applets-screenshooter.png)
to start the User_Report.py report creation.
Report_fred-ghostbsd-pc1_2020-04-05   A sample output file, that collects all the configuration data in one file to report computer status
User_Report.py   a python program to  run the shell script User_Report.sh  
User_Report.sh   The orginal FreeBSD shell script taken from blog  https://revadig.blogspot.com/2019/09/freebsd-workstation-user-report.html

Examples of shell script usage without Python to generate and create the "Report Computer Status".  One line uses /bin/sh inside a shell script file.  The 2nd line uses the GhostBSD standard "Fish Shell" to generate and create the "Report Computer Status" 
#!/bin/sh
# User_Report.sh  > Report_$(hostname)_$(date +%F) && gzip Report_$(hostname)_$(date +%F)
## /bin/fish User_Report.sh  > Report_(hostname)_(date +%F) && gzip Report_(hostname)_(date +%F)
### /bin/sh /usr/share/generate_user_report/User_Report.sh > ~/Desktop/Report_$(hostname)_$(date +%F) && gzip ~/Desktop/Report_$(hostname)_$(date +%F)

