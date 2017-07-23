import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class MyWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Hello World")

        self.box = Gtk.Box(spacing=6)
        self.add(self.box)

        self.button1 = Gtk.Button(label="Hello")
        self.button1.connect("clicked", self.button1_click)
        self.box.pack_start(self.button1, True, True, 0)

        self.button2 = Gtk.Button(label="Goodbye")
        self.button2.connect("clicked", self.button2_click)
        self.box.pack_start(self.button2, True, True, 0)
        
        self.button3 = Gtk.Button(label="Another")
        self.box.pack_start(self.button3, True, False, 0)

    def button1_click(self, widget):
        print("Hello World")
    def button2_click(self, widget):
        print("Goodbye World")

win = MyWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()