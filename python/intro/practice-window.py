import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gio

class WelcomeButton(Gtk.Button):
	def __init__(self, image, title, description):
		Gtk.Button.__init__(self)
		self.label="hello"
		self.button_grid = Gtk.Grid(orientation=Gtk.Orientation.HORIZONTAL)
		self.button_grid.set_column_spacing(12)
		self.add(self.button_grid)

		self.button_icon = Gtk.Image.new_from_icon_name(image, Gtk.IconSize.DIALOG)
		self.button_grid.attach(self.button_icon,0,0,1,2)

		self.button_title = Gtk.Label()
		self.button_title.set_markup("<span size='x-large' font-weight='light'>"+title+"</span>")
		self.button_title.set_halign(Gtk.Align.START)
		self.button_title.set_valign(Gtk.Align.END)
		self.button_grid.attach(self.button_title,1,0,1,1)

		self.button_description = Gtk.Label()
		self.button_description.set_markup("<span font-weight='regular' fgalpha='50%'>"+description+"</span>")
		self.button_description.set_halign(Gtk.Align.START)
		self.button_description.set_valign(Gtk.Align.START)
		self.button_description.set_line_wrap(True)
		self.button_description.set_line_wrap(True)
		self.button_grid.attach(self.button_description,1,1,1,1)


		self.get_style_context().add_class(Gtk.STYLE_CLASS_FLAT)

class TryingWindow(Gtk.Window):
	def __init__(self):
		Gtk.Window.__init__(self, title="A Practice Window")
		self.set_border_width(10)

		header = Gtk.HeaderBar()
		header.set_show_close_button(True)
		header.props.title = "A Practice Window"
		header.props.subtitle = "I actually made this myself!"
		self.set_titlebar(header)

		welcome_grid = Gtk.Grid(orientation=Gtk.Orientation.VERTICAL)
		welcome_grid.set_column_spacing(12)
		welcome_grid.set_row_spacing(12)
		welcome_grid.set_halign(Gtk.Align.CENTER)
		welcome_grid.set_valign(Gtk.Align.CENTER)
		welcome_grid.set_margin_top(24)
		self.add(welcome_grid)

		welcome_grid.add(WelcomeButton("accessories-text-editor", 
			title="Create a document", 
			description="You need to make something first if you want to do anything with it."))
		
		welcome_grid.add(WelcomeButton("printer", 
			title="Print", 
			description="This should take you to the PaperCut website."))

win = TryingWindow()
win.connect("delete-event", Gtk.main_quit)
win.show_all()
Gtk.main()
