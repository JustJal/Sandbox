using System;
using System.Collections.Generic;
namespace Permutations
{
    public class Permutations
    {
        public static List<string> PermutationsList = new List<string>();
        static int NumberOfStrings = 0;
        static string Word { get; set; }
        public static List<string> SinglePermutations(string word)
        {
            int MaxPermutations = word.Length <= 2 ? word.Length : Factorial(word.Length) / word.Length;
            // The max permutations when N > 2 is N!/N (I learned about permutations before making this code)

            if (!PermutationsList.Contains(word))
                PermutationsList.Add(word); // The word is a solution

            Char[] WordArray = word.ToCharArray();

            for (int i = 0; i < word.Length - 1; i++)
            {
                for (int j = 0; j < word.Length - 1 - i; j++)
                {
                    var temp = WordArray[j];
                    WordArray[j] = WordArray[j + 1];
                    WordArray[j + 1] = temp;
                    Word = GetString(WordArray);
                    if (!PermutationsList.Contains(Word))
                    {
                        PermutationsList.Add(Word);
                        NumberOfStrings++;
                    }
                }
                if (NumberOfStrings == MaxPermutations)
                    break;
            }

            return PermutationsList;
        }
        private static int Factorial(int n, int Returner = 1)
        {
            if (n > 0)
                return Factorial(n - 1, Returner * n);

            return Returner;
        }

        private static string GetString(char[] array)
        {
            string str = string.Concat(array);

            return str;
        }
        public static void PrintList(List<string> List)
        {
            foreach (string a in List)
            {
                Console.WriteLine(a);
            }
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

