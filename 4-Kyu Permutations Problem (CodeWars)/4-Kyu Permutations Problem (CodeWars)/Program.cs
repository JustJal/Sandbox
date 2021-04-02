using System;
namespace Permutations
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    public class Permutations
    {

        static string Word { get; set; }
        public static List<string> SinglePermutations(string word)
        {

            int NumberOfStrings = 0;
            List<string> PermutationsList = new List<string>();


            int MaxPermutations = GetMaxPermutations(word);

            if (!PermutationsList.Contains(word))
            {
                PermutationsList.Add(word); // The word is a solution
                NumberOfStrings++;
            }
                
            Char[] WordArray = word.ToCharArray();

            while (!(NumberOfStrings == MaxPermutations))
            {
                for (int j = 0; j < word.Length - 1; j++)
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
            }
            return PermutationsList;
        }
        private static int GetMaxPermutations(string Word)
        {
            int NumberOfDifferents = 1;
            Char[] WordArray = Word.ToCharArray();
            var Counter = WordArray.GroupBy(x => x).Where(x => x.Count() != 1);

            foreach(var x in Counter)
            {
                NumberOfDifferents = NumberOfDifferents * Factorial(x.Count());
            }

            int MaxPermutations = Factorial(Word.Length) / NumberOfDifferents;

            return MaxPermutations;
        }
        private static int Factorial(int n)
        {
            for (int i = n - 1; i > 0; i--)
                n *= i;

            return n;
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
            Permutations.PrintList(Permutations.SinglePermutations("aabb"));
            Console.ReadKey();
        }
    }
}

