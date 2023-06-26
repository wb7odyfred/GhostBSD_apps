# GhostBSD_apps
Fred's  GURU little app projects for GhostBSD Application development

These 4 files comprise GURU  Generate User Report for Upload: 
  * User_Report.py 
  * User_Report.sh
  * generate_user_report.desktop  
  * applets-screenshooter.png
      
  GURU is used to collect the configuration data from the GhostBSD Operating System for sharing with another user for ***help purposes***   A method to make a python GUI app, **User_Report.py**, that creates a block menu with 2 buttons. This is for a new GhostBSD user to get help with configuration and driver problems by clicking on a desktop application icon, **generate_user_report.desktop**, and the click a  ***create report*** button.   This simple app allows a ***new GHOSTBSD desktop GUI user*** to click a button and create a comprehensive computer configuration single text file that is then gzipped to a smaller size for sharing via Telegram https://t.me/GhostBSD or email.   This comprehensive computer configuration file Report contains most of the information to diagnose the users computer problem.  Sharing this report with a more experienced GhostBSD user for him to read many details and configuration files, listed in this report.  This  one file eliminates many additional requests, for just a little more information (ie just one more configuration file item that was not already requested).  Use ***GURU*** for creating an initial copy of the many configuration files for post review.  Later you can compare your present configuration files with the original boot image configuration files that you saved using ***GURU***.  ***GURU*** creates two items a Report text file and a gzipped file from that Report text file.

+ Sample Icon highcolor/48x48/applets-screenshooter.png   Clicking on this sample icon,  makes the .desktop file execute ***GURU*** 
"Generate_User_Report.desktop" to execute the command line "python User_Report.py"  Read the Generate_User_Report.desktop file for specific details.  
+ User_Report.py is a python GUI application file to execute the following command line: 

>`/bin/sh /usr/share/generate_user_report/User_Report.sh   > Report_$(hostname)_$(date +%F) && gzip Report_$(hostname)_$(date +%F)`
>


The Gnome .desktop file (Generate_User_Report.desktop) for this clickable desktop ICON file (applets-screenshooter.png)
to start the User_Report.py report creation.
* Report_fred-ghostbsd-pc1_2020-04-05   A sample output file, that collects all the configuration data in one file, to report computer status
* User_Report.py   a python program to  run the shell script User_Report.sh  
* User_Report.sh   The orginal FreeBSD shell script taken from blog  https://revadig.blogspot.com/2019/09/freebsd-workstation-user-report.html

Examples of shell script usage without Python to generate and create the "Report Computer Status".  One line uses /bin/sh inside a shell script file.  The 2nd line uses the GhostBSD standard "Fish Shell" to generate and create the "Report Computer Status" 

> `#!/bin/sh User_Report.sh  > Report_$(hostname)_$(date +%F) && gzip Report_$(hostname)_$(date +%F)`
> 
> `# /bin/fish User_Report.sh  > Report_(hostname)_(date +%F) && gzip Report_(hostname)_(date +%F)`
> 
> `# /bin/sh /usr/share/generate_user_report/User_Report.sh > ~/Desktop/Report_$(hostname)_$(date +%F) && gzip ~/Desktop/Report_$(hostname)_$(date +%F)`
>  The above lines are examples to copy and paste into a command line and create Reports in a user shell command terminal.  
>  These text line examples can be performed over SSH into a remotely connected computer terminal shell.
>  


