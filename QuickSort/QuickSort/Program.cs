using System;

namespace Sorting
{
    public class SortingMethods
    {
        static int Partition(int[] MyArray, int Begin, int End)
        {
            int pivot = MyArray[Begin];
            while (true)
            {
                while (MyArray[Begin] < pivot)
                    Begin++;

                while (MyArray[End] > pivot)
                    End--;

                if (Begin < End)
                {
                    if (MyArray[Begin] == MyArray[End]) return End;

                    var temp = MyArray[Begin];
                    MyArray[Begin] = MyArray[End];
                    MyArray[End] = temp;
                }
                else
                    return End;
            }
        }

        public static void QuickSort(int[] MyArray, int Begin, int End)
        {
            if (Begin < End)
            {
                int pivot = Partition(MyArray, Begin, End);

                if (pivot > 1)
                    QuickSort(MyArray, Begin, pivot - 1);
                if (pivot + 1 < End)
                    QuickSort(MyArray, pivot + 1, End);
            }
        }

        public static void BubbleSort(int[] MyArray)
        {

            for (int i = 0; i < MyArray.Length - 1; i++)
            {
                int flag = 0;
                for (int j = 0; j < MyArray.Length - 1 - i; j++)
                {
                    if (MyArray[j] > MyArray[j + 1])
                    {
                        var temp = MyArray[j];
                        MyArray[j] = MyArray[j + 1];
                        MyArray[j + 1] = temp;

                        flag = 1; //Sorting Happened
                    }
                }

                if (flag == 0) break; // If it didnt happen then we break the loop
            }
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            int[] MyArray = new int[] { 12, 2, 23, 122, 22, 3, 43, 46, 76, 785, 87, 568, 797, 90, 80, 56, 908, 80, 78, 89 };

            Console.WriteLine("The original Array is:");
            for (int i = 0; i < MyArray.Length - 1; i++)
                Console.Write(MyArray[i] + " ");
            Console.WriteLine();

            SortingMethods.QuickSort(MyArray, 0, MyArray.Length - 1);

            Console.WriteLine("\nThe QuickSorted Array is:");
            for (int i = 0; i < MyArray.Length - 1; i++)
                Console.Write(MyArray[i]+ " ");
            Console.WriteLine();


            int[] MyArray2 = new int[] { 12, 2, 23, 122, 22, 3, 43, 46, 76, 785 };

            Console.WriteLine("\nThe original Array is:");
            for (int i = 0; i < MyArray2.Length - 1; i++)
                Console.Write(MyArray2[i] + " ");
            Console.WriteLine();

            SortingMethods.BubbleSort(MyArray2);

            Console.WriteLine("\nThe BubbleSorted Array is:");
            for (int i = 0; i < MyArray2.Length - 1; i++)
                Console.Write(MyArray2[i] + " ");

            Console.ReadKey();
        }
    }
}
