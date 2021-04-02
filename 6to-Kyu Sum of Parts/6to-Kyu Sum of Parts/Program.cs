using System;
using System.Linq;

namespace SumOfParts
{
    class SumParts
    {
        public static int[] PartsSums(int[] ls)
        {
            int End = ls.Length;
            int[] Solution = new int[End+1];
            int Counter = 0;

                do
                {
                    Solution[Counter] = ls.Sum();
                    ls = ls.Where(x => x != ls[0])
                           .ToArray();
                    Counter++;
                } while (ls.Length != 0);

            return Solution;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            int[] xd = new int[6] { 1, 2, 3, 4, 5, 6 };
           xd = SumParts.PartsSums(xd);
            foreach (int a in xd)
                Console.Write(a+" ");

            Console.ReadKey();
        }
    }
}
