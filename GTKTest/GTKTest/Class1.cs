using System;
using Gtk;

namespace GTKTest
{
    public class SharpApp : Window
    {
       public SharpApp() : base("First Application")
        {
            SetDefaultSize(250, 200);
            SetPosition(WindowPosition.Center);
            SetIconFromFile("Dolphin.png");
            DeleteEvent += delegate { Application.Quit(); };

            Fixed fix = new Fixed();

            Button Mine1 = new Button("Nope");
            Mine1.Sensitive = false;
            Button Mine2 = new Button("Click Me HAHA");
            Button Mine3 = new Button(Stock.Close);
            Button Mine4 = new Button("Nah you cannot click me");
            Mine4.SetSizeRequest(90, 100);

            fix.Put(Mine1, 20, 30);
            fix.Put(Mine2, 100, 30);
            fix.Put(Mine3, 20, 80);
            fix.Put(Mine4, 100, 80);

            Add(fix);
            ShowAll();
        }

        public static void Main(string[] args)
        {
            Application.Init();
            new SharpApp();
            Application.Run();
        }
    }
}
