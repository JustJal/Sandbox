using System;
using System.Collections.Generic;
using System.Linq;
namespace Permutations
{
    public class Permutations
    {
        public static List<string> PermutationsList = new List<string>();
        static int NumberOfStrings;
        public static List<string> SinglePermutations(string word)
        {
            int MaxPermutations = word.Length <= 2 ? word.Length : Factorial(word.Length) / word.Length;
            // The max permutations when N > 2 is N!/N (I learned about permutations before making this code)
            PermutationsList.Add(word); // The word is a solution
            Char[] WordArray = word.ToCharArray();

            while (!ItIsFull(PermutationsList, MaxPermutations)) //while the list is not full of different solutions
            {
                for (int i = 0; i < word.Length - 1; i++)
                {
                    for (int j = 0; j < word.Length - 1 - i; j++)
                    {
                        var temp = WordArray[j];
                        WordArray[j] = WordArray[j + 1];
                        WordArray[j + 1] = temp;
                        PermutationsList.Add(GetString(WordArray));
                    }
                    if (ItIsFull(PermutationsList, MaxPermutations))
                        break;
                }
            }
            return PermutationsList;
        }

        /* this method distinct every string in the list, 
           if the list have the same differents solutions of max permutations, then it finish*/
        public static bool ItIsFull(List<string> List, int MaxPermutations)
        {
            var differents = List.Distinct().ToList();
            NumberOfStrings = 0;

            foreach (string a in differents)
            {
                NumberOfStrings++;
            }
            if (NumberOfStrings == MaxPermutations)
            {
                PermutationsList = PermutationsList.Distinct().ToList(); //The same method makes the main list a list with different solutions
                return true;
            }
            return false;
        }
        private static int Factorial(int n, int Returner = 1)
        {
            if (n > 0)
                return Factorial(n - 1, Returner * n);

            return Returner;
        }
        public static void PrintList(List<string> List)
        {
            foreach (string a in List)
            {
                Console.WriteLine(a);
            }
        }

        private static string GetString(char[] array)
        {
            string str = string.Concat(array);

            return str;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Permutations.SinglePermutations("aabb");
            Permutations.PrintList(Permutations.PermutationsList);
            Console.ReadKey();
        }
    }
}
