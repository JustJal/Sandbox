using System;

namespace Suma {
    class Suma {
        static void Main (string[] args){

              double a;
              double b;
              double c;

              Console.WriteLine ("Ingrese el primer valor:");

              a = Convert.ToDouble(Console.ReadLine());

              Console.WriteLine ("Ingrese el segundo valor:");

              b = Convert.ToDouble(Console.ReadLine());

              c = a + b;

              Console.WriteLine ("La suma de: {0} + {1} es igual a {2}", a, b, c);
              Console.ReadLine ();

        }
    }
}