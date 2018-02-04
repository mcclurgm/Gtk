# Python Gtk Notes / Cheatsheet

```python
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
```
## Containers
### Box
```python
box = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL)

box.pack_start(child,
                    expand element to fill space?,
                    expand by padding (False) or resizing (True),
                    padding)

box.pack_start(element)    # left-to-right
box.pack_end(element)      # right-to-left
```

### Grid
```python
Gtk.Grid.add(child)    # Appends to grid in set orientation
Gtk.Grid.attach(child,
                attach left side to column,
                attach top side to row,
                width, height)

Gtk.Grid.attach_next_to(child,
                        sibling, side (l,r,u,d),
                        width, height)
```
Optional alignment, works like Box

### ListBox
Vertical container, children: `ListBoxRow`  
Alternative: `TreeView`  
```python
set_selection_mode(mode)
ListBoxRowWithData(string)
```
#### Sort, filter: 
```python
listbox.set_sort_func(sort_func, data, notify_destroy)
listbox.set_filter_func(filter_func, data, notify_destroy)
#   I have no idea what notify_destroy does on this. 
#   I don't know if it should even exist.
#   Documentation (at least one site) mentions nothing about it.

def sort_func(row1, row2, data, notify_destroy):
    if row1 > row2:
        return True
    else:
        return False

def filter_func(row, data, notify_destroy):
    if "stays":
        return True
    else if "filtered out":
        return False
```

## Controls
### Button
```python
button = Gtk.Button(label="label")
```

### Label
```python
label = Gtk.Label("Some Text")
formattedLabel = Gtk.Label()
formattedLabel.set_markup("<span size='large' font-weight='light'>Some Formatted Tex</span>")
#   My most used: <big>Text</big>
#                 <span fgalpha='50%'>Text</span>
```

### Icon (using Gtk.Image)
```python
icon = Gtk.Image.new_from_icon_name(image, Gtk.IconSize.BUTTON)
self.button_grid.attach(self.button_icon,0,0,1,2)
```
[Reference for image sizes](https://developer.gnome.org/gtk3/stable/gtk3-Themeable-Stock-Images.html#GtkIconSize)

## Formatting
### Alignment
```python
set_halign(Gtk.Align.START)
set_valign(Gtk.Align.CENTER)
```

### Style classes
```python
button.get_style_context().add_class(Gtk.STYLE_CLASS_FLAT)
```