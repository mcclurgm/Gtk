import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class myWindow(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Title")
        pass

win = myWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()

BOX
self.box.pack_start(child, expand element to fill space?, expand by padding (False) or resizing (True) element?, padding)
pack_start: left-to-right; pack_end: right-to-left


GRID
Gtk.Grid.attach(child, attach left side to column, attach top side to row, width, height)
Gtk.Grid.attach_next_to(child, sibling, side (l,r,u,d), width, height)

LISTBOX
Vertical container, children: ListBoxRow
Alternative: TreeView
set_selection_mode(mode)
ListBoxRowWithData(string)
sort, filter: 
  listbox.set_sort_func(sort_func, data, notify_destroy?)
  same for filter
  def sort_func(row1, row2, data, notify_destroy):
    True if row1 > row2
  def filter_func(row, data, notify_destroy):
    True if stays, False if filtered out