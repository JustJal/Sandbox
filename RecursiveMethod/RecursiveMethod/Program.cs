using System;
using System.Linq;

namespace RecursiveMethod
{
    class Recursive
    {
        private string Recursive_Method(int n, string tail = "")
        {
            /*if (n > 9)
                throw new InvalidOperationException("n cannot be larger than 9");*/
            /* I dont need that exception since Enumerable.Repeat() 
            admits every type and not just a char as new string(char, int)*/

            if (n > 0)
                return Recursive_Method(n - 1, string.Concat(Enumerable.Repeat(n.ToString(), n)) + tail);

            return tail;
        }

        private int Factorial(int n, int Returner = 1)
        {
            if (n > 0)
                return Factorial(n - 1, Returner * n);

            return Returner;
        }
        static void Main(string[] args)
        {
            Recursive R = new Recursive();
            Console.WriteLine(R.Recursive_Method(10));
            Console.WriteLine(R.Factorial(9));
            Console.ReadKey();
        }
    }
}
