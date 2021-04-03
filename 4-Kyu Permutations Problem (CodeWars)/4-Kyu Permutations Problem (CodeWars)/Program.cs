using System;
namespace Permutations
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    public class Permutations
    {

        static string Word { get; set; }
        static int NumberOfStrings { get; set; }
        public static List<string> SinglePermutations(string word)
        {
            NumberOfStrings = 1;
            List<string> PermutationsList = new List<string>();
            int MaxPermutations = GetMaxPermutations(word);
            PermutationsList.Add(word);

            if(NumberOfStrings != MaxPermutations)
                return Permutate(PermutationsList, 0, MaxPermutations, word);

            return PermutationsList;
        }
        private static List<string> Permutate (List<string> ls, int k, int MaxPermutations, string word)
        {
            char[] WordArray = word.ToCharArray();

            if (k >= word.Length - 1) 
                k = 0;

            Swap(ref WordArray[k], ref WordArray[k + 1]);
            
            Word = GetString(WordArray);

                if (!ls.Contains(Word))
                {
                    ls.Add(Word);
                    NumberOfStrings++;
                }

                if (!(NumberOfStrings == MaxPermutations))
                    return Permutate(ls, k + 1, MaxPermutations, Word);
            
                return ls;
                
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
        private static int Factorial(int n, int Tail = 1)
        {
            if (n > 0)
                return Factorial(n - 1, Tail * n);

            return Tail;
        }

        private static string GetString(char[] array) => string.Join("",array);
        
        private static void Swap (ref char A, ref char B)
        {
            var temp = A;
            A = B;
            B = temp;
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
            Permutations.PrintList(Permutations.SinglePermutations("a"));
            Console.WriteLine();
            Permutations.PrintList(Permutations.SinglePermutations("ab"));
            Console.WriteLine();
            Permutations.PrintList(Permutations.SinglePermutations("aabb"));
            Console.ReadKey();
        }
    }
}

