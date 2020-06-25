using System;
using Gtk;

namespace SimpleCalculator
{
    class Calculator : Window
    {
        public Calculator() : base("Calculator")
        {
            SetDefaultSize(250, 200);
            SetPosition(WindowPosition.Center);
            DeleteEvent += delegate { Application.Quit(); };

            VBox vbox = new VBox(false, 2);

            MenuBar mb = new MenuBar();
            Menu filemenu = new Menu();
            MenuItem file = new MenuItem("File");
            file.Submenu = filemenu;
            mb.Append(file);

            vbox.PackStart(mb, false, false, 0);

            Table table = new Table(5, 4, true);

            table.Attach(new Button("Cls"), 0, 1, 0, 1);
            table.Attach(new Button("Bck"), 1, 2, 0, 1);
            table.Attach(new Label(), 2, 3, 0, 1);
            table.Attach(new Button("Close"), 3, 4, 0, 1);

            table.Attach(new Button("7"), 0, 1, 1, 2);
            table.Attach(new Button("8"), 1, 2, 1, 2);
            table.Attach(new Button("9"), 2, 3, 1, 2);
            table.Attach(new Button("/"), 3, 4, 1, 2);

            table.Attach(new Button("4"), 0, 1, 2, 3);
            table.Attach(new Button("5"), 1, 2, 2, 3);
            table.Attach(new Button("6"), 2, 3, 2, 3);
            table.Attach(new Button("*"), 3, 4, 2, 3);

            table.Attach(new Button("1"), 0, 1, 3, 4);
            table.Attach(new Button("2"), 1, 2, 3, 4);
            table.Attach(new Button("3"), 2, 3, 3, 4);
            table.Attach(new Button("-"), 3, 4, 3, 4);

            table.Attach(new Button("0"), 0, 1, 4, 5);
            table.Attach(new Button("."), 1, 2, 4, 5);
            table.Attach(new Button("="), 2, 3, 4, 5);
            table.Attach(new Button("+"), 3, 4, 4, 5);

            vbox.PackStart(new Entry(), false, false, 0);
            vbox.PackEnd(table, true, true, 0);

            Add(vbox);
            ShowAll();
        }
        static void Main()
        {
            Application.Init();
            new Calculator();
            Application.Run();
        }
    }
}
