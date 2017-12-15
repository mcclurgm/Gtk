import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class MyWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Hello World")

        self.box = Gtk.Box(spacing = 6)
        self.add(self.box)

        self.button = Gtk.Button(label="A Button!")
        self.button.connect("clicked", self.on_button_clicked)
        self.box.pack_start(self.button, True, True, 0)

        self.mylabel = Gtk.Label(label="hello")
        self.box.pack_start(self.mylabel, True, True, 0)
    
    def on_button_clicked(self, widget):
        print("Hello")

win = MyWindow()
win.connect("delete-event", Gtk.main_quit)

win.show_all()
Gtk.main()