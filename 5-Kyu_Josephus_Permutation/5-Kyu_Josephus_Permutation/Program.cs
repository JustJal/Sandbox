using System;
using System.Collections.Generic;
using System.Linq;
namespace _5_Kyu_Josephus_Permutation
{
    public class Josephus
    {
        public static List<object> JosephusPermutation (List<object> items, int k)
        {
            if (!items.Any()) return items; //If the list is empty you dont need to do anything
            if (k == 1) return items; //If the steps are one by one, the you dont need to create a new list
            
            object[] _item = items.ToArray(); // Create an array so youll know when to stop with its length
            int End = _item.Length;
            int Count = 1;
            List<object> result = new List<object>();
            int Index = 0;

            do
            {
                if (End == 1)
                {
                    result.Add(_item[0]);
                    break;
                }

                if (Count == k) //If the count equals the step then...
                {
                    result.Add(_item[Index]); //... We add the object to solution List...
                    _item = _item.Where(x => x != _item[Index]).ToArray();// ... We create a new array without the object
                    End = _item.Length;
                    Count = 1; //return to 1 the count
                }

                Index++; //Movement through index

                if (Index >= End) Index = Index - End; //Getting where the index is inside the range of array

                Count++;

            } while (End != 0);

            return result;
        }
        public static void PrintResult(List<object> result)
        {
            foreach (object a in result)
            {
                Console.Write(a + " ");
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            List<object> result = new List<object>() {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
            Josephus.PrintResult(Josephus.JosephusPermutation(result, 3));
        }
    }
}
