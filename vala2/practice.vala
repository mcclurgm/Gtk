using Gtk;

class CounterWindow : Window {
    Entry entry;

    public CounterWindow () {
        window_position = WindowPosition.CENTER;
        border_width = 10;

        var header = new HeaderBar ();
        header.title = "A Practice App";
        header.subtitle = "Counter";
        header.show_close_button = true;
        set_titlebar (header);

        var box = new Box (Orientation.HORIZONTAL, 12);
        box.halign = Align.CENTER;
        box.valign = Align.CENTER;
        this.add(box);

        var counter_label = new Label ("Counter:");
        box.add (counter_label);

        entry = new Entry ();
        entry.set_text ("0");
        box.add (entry);

        var sub_button = new Button.with_label ("-");
        sub_button.clicked.connect (iterate_sub);
        box.pack_start (sub_button, false, false, 0);
        //  sub_button.get_style_context ()
        //      .add_class (STYLE_CLASS_FLAT);
        
        var add_button = new Button.with_label ("+");
        add_button.clicked.connect (iterate_add);
        box.pack_start (add_button, false, false, 0);
    }

    void iterate_add () {
        var int_value = int.parse (entry.get_text ());
        int_value ++;
        entry.set_text(int_value.to_string ());
    }

    void iterate_sub () {
        var int_value = int.parse (entry.get_text ());
        int_value --;
        entry.set_text(int_value.to_string ());
    }
}

class AccumulatorWindow : Window {
    Entry entry;
    Label sum_label;
    int sum;

    public AccumulatorWindow () {
        sum = 0;
        window_position = WindowPosition.CENTER;
        border_width = 10;

        var header = new HeaderBar ();
        header.title = "A Practice App";
        header.subtitle = "Accumulator";
        header.show_close_button = true;
        set_titlebar (header);

        var grid = new Grid ();
        grid.column_spacing = 12;
        grid.row_spacing = 12;
        grid.halign = Align.CENTER;
        grid.valign = Align.CENTER;
        this.add(grid);

        var counter_label = new Label ("Counter:");
        grid.attach (counter_label, 0, 0, 1, 1);

        entry = new Entry ();
        entry.set_text ("0");
        entry.activate.connect (accumulate);
        grid.attach (entry, 1, 0, 1, 1);

        var sum_description = new Label ("Sum: ");
        grid.attach (sum_description, 0, 1, 1, 1);

        sum_label = new Label ("0");
        grid.attach (sum_label, 1, 1, 1, 1);
    }

    void accumulate () {
        var int_value = int.parse (entry.get_text ());
        sum = sum + int_value;
        sum_label.set_text (sum.to_string ());
    }

    void iterate_add () {
        var int_value = int.parse (entry.get_text ());
        int_value ++;
        entry.set_text(int_value.to_string ());
    }

    void iterate_sub () {
        var int_value = int.parse (entry.get_text ());
        int_value --;
        entry.set_text(int_value.to_string ());
    }
}

static int main (string[] args) {
    init (ref args);
    
    var window = new AccumulatorWindow ();
    window.destroy.connect (main_quit);
    window.show_all ();

    Gtk.main ();
    return 0;
}