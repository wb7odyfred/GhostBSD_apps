#!/usr/local/bin/python
# SPDX-License-Identifier: MIT-0
# https://www.freedesktop.org/software/systemd/man/os-release.html

import ast
import re
import distro
import gi
import os
#  python3 -c 'import distro; print(distro.id())'
# ghostbsd
print(distro.id())

gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

def read_os_release():
    try:
        filename = '/etc/os-release'
        f = open(filename)
    except FileNotFoundError:
        filename = '/usr/lib/os-release'
        f = open(filename)
    for line_number, line in enumerate(f, start=1):
        line = line.rstrip()
        if not line or line.startswith('#'):
            continue
        m = re.match(r'([A-Z][A-Z_0-9]+)=(.*)', line)
        if m:
            name, val = m.groups()
            if val and val[0] in '"\'':
                val = ast.literal_eval(val)
            yield name, val
        else:
            print(f'{filename}:{line_number}: bad line {line!r}',
                  file=sys.stderr)

os_release = dict(read_os_release())

id_name = os_release.get('ID', 'Linux')
print(f'Simple ID is {id_name!r}')
id_name = os_release.get('ID', 'GhostBSD')
print(f'Simple ID is {id_name!r}')


if 'ghostbsd' in [os_release.get('ID', 'ghostbsd'),
                *os_release.get('ID_LIKE', '').split()]:
    print('Looks like ghostbsd!')


class MyWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="User Computer configuration report")
        self.set_border_width(10)

        hbox = Gtk.Box(spacing=6)
        self.add(hbox)

        self.button = Gtk.Button(label="Create User Computer report")
        self.button.connect("clicked", self.on_button_clicked)
        hbox.pack_start(self.button,True,True,0)

        self.button_open = Gtk.Button(label="Open generated report")
        self.button_open.connect("clicked", self.on_button_open_clicked)
        hbox.pack_end(self.button_open, True,True,0)

    def on_button_clicked(self, widget):
#        os.system('/bin/sh /usr/share/generate_user_report/User_Report.sh')  #  Create a Report_hostname_date.txt file on the Desktop  Gzip that Report.txt file into Report.txt.gz file
#       check for ghostbsd , else freebsd, check for  debian  
         if 'ghostbsd' in [os_release.get('ID', 'ghostbsd'), 
                *os_release.get('ID_LIKE', '').split()]:
            os.system('/bin/sh /usr/local/lib/generate_user_report/User_Report.sh > ~/Desktop/Report_$(hostname)_$(date +%F).txt && gzip -fk ~/Desktop/Report_$(hostname)_$(date +%F).txt')
         else:
            os.system('/bin/sh /usr/local/lib/generate_user_report/User_Report_FreeBSD.sh > ~/Desktop/Report_$(hostname)_$(date +%F).txt && gzip -fk ~/Desktop/Report_$(hostname)_$(date +%F).txt')
         if 'debian' in [os_release.get('ID', 'linux'),
                *os_release.get('ID_LIKE', '').split()]:
            os.system('/bin/sh /usr/local/lib/generate_user_report/User_Report_Debian.sh > ~/Desktop/Report_$(hostname)_$(date +%F).txt && gzip -fk ~/Desktop/Report_$(hostname)_$(date +%F).txt')


    def on_button_open_clicked(self, widget):
        os.system("xdg-open ~/Desktop/Report_$(hostname)_$(date +%F).txt")

win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
