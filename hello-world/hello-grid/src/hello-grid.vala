int main(string[] args) {
    Gtk.init(ref args);

    var window = new Gtk.Window();
    window.title = "Hello Again";
    window.set_border_width(12);
    window.set_position(Gtk.WindowPosition.CENTER);
    window.set_default_size(350,70);
    window.destroy.connect(Gtk.main_quit);

    var layout = new Gtk.Grid();
    layout.orientation = Gtk.Orientation.VERTICAL;
    layout.column_spacing = 6;
    layout.row_spacing = 6;

    var hello_button = new Gtk.Button.with_label("Click me");
    var hello_label = new Gtk.Label(null);

    var rotate_button = new Gtk.Button.with_label("Rotate");
    var rotate_label = new Gtk.Label("Horizontal");

    // row one
    layout.attach(hello_button, 0, 0, 1, 1);
    layout.attach_next_to(hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);
    //row two
    layout.attach(rotate_button, 0, 1, 1, 1);
    layout.attach_next_to(rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

    window.add(layout);

    hello_button.clicked.connect (() => {
        hello_label.label = "Hello World";
        hello_button.sensitive = false;
    });
    rotate_button.clicked.connect(() => {
        rotate_label.angle += 90;
        if(rotate_label.label == "Vertical") {
            rotate_label.label = "Horizontal";
        } else {
            rotate_label.label = "Vertical";
        }
        //  rotate_button.sensitive = false;
    });

    window.show_all();
    Gtk.main();
    return 0;
}
