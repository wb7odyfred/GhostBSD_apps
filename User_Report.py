import gi
import os
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class MyWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="User Computer configuration report")

        self.button = Gtk.Button(label="Create User Computer report")
        self.button.connect("clicked", self.on_button_clicked)
        self.add(self.button)

    def on_button_clicked(self, widget):
#        os.system('/bin/sh /usr/share/generate_user_report/User_Report.sh')
        os.system('/bin/sh /usr/share/generate_user_report/User_Report.sh > ~/Desktop/Report_$(hostname)_$(date +%F) && gzip ~/Desktop/Report_$(hostname)_$(date +%F)')

win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
