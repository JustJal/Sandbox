using System;
using System.Collections.Generic;
using System.Linq;
namespace LinqTesting
{
    class QuadraticEquation
    {
        public double X { get; set; }
        public int A { get; set; }
        public int B { get; set; }
        public int C { get; set; }
        private static int count;

        public static List<QuadraticEquation> ImaginaryEquations = new List<QuadraticEquation>();
        public static List<QuadraticEquation> RealEquations = new List<QuadraticEquation>();
        
        public QuadraticEquation(int A, int B, int C)
        {
            this.A = A;
            this.B = B;
            this.C = C;
            X = Math.Pow(B, 2) - (4 * A * C);
        }
        public static void PrintEquations(List<QuadraticEquation> Eq)
        {
            count = 1;
            foreach (QuadraticEquation Value in Eq)
            {
                Console.WriteLine("The Equation #{0} is: {1}X^2 + ({2}X) + ({3})\n Discriminant = {4}\n", count, Value.A, Value.B, Value.C, Value.X);
                count++;
            }
        }
        public static void SplitLists(List<QuadraticEquation> EqList)
        {
            ImaginaryEquations = EqList.Where(ImagOP => ImagOP.X < 0)
                                       .ToList();
            RealEquations = EqList.Where(ImagOP => ImagOP.X >= 0)
                                  .ToList();
        }
    }
    static class Program
    {
        static void Main(string[] args)
        {
            List<QuadraticEquation> AllEquations = new List<QuadraticEquation>();
            AllEquations.AddRange(
                new[]
            {
                new QuadraticEquation(1, 1, 1),
                new QuadraticEquation(3, 2, 1),
                new QuadraticEquation(8, 3, 1),
                new QuadraticEquation(2, -2, 5),
                new QuadraticEquation(1, 6, 2),
                new QuadraticEquation(1, 8, 3),
                new QuadraticEquation(2, 6, 1),
                new QuadraticEquation(1, 6, 2)
            });

            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("The Equations are:\n");
            Console.ForegroundColor = ConsoleColor.White;
            QuadraticEquation.PrintEquations(AllEquations);

            QuadraticEquation.SplitLists(AllEquations);

            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("The Imaginary Equations are:\n");
            Console.ForegroundColor = ConsoleColor.DarkCyan;
            QuadraticEquation.PrintEquations(QuadraticEquation.ImaginaryEquations);

            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("The Real Equaions are:\n");
            Console.ForegroundColor = ConsoleColor.DarkMagenta;
            QuadraticEquation.PrintEquations(QuadraticEquation.RealEquations);

            Console.ReadKey();
        }
    }     
}
