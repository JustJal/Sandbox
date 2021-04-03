using System;
using System.Linq;

namespace SumOfParts
{
    class SumParts
    {
        public static int[] PartsSums(int[] ls)
        {
            int End = ls.Length;
            int[] Solution = new int[End + 1];
            int Sum = 0;
            Solution[0] = ls.Sum();

            for (int i = 1; i < Solution.Length - 1; i++)
            {
                Sum += ls[i - 1];
                Solution[i] = Solution[0] - Sum;
            }

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

            Console.ReadKey();// 21, 20, 18, 15, 11, 6, 0 
        }
    }
}
