import gi
import os
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

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
#        os.system('/bin/sh /usr/share/generate_user_report/User_Report.sh')
        os.system('/bin/sh /usr/share/generate_user_report/User_Report.sh > ~/Desktop/Report_$(hostname)_$(date +%F) && gzip -fk ~/Desktop/Report_$(hostname)_$(date +%F)')

    def on_button_open_clicked(self,widget):
        os.system("xdg-open ~/Desktop/Report_$(hostname)_$(date +%F)")

win = MyWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
