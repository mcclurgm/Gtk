int main(string[] args) {
    Gtk.init(ref args);

    var header = new Gtk.HeaderBar();
    header.show_close_button = true;

    var window = new Gtk.Window();
    window.set_titlebar(header);
    window.set_default_size(350, 70);
    window.border_width = 10;

    window.add(new Gtk.Button.with_label("hello there"));

    window.destroy.connect(Gtk.main_quit);
    window.show_all();
    Gtk.main();
    return 0;
}