using System;

namespace Bidimensional_Spiral
{
    public class Bidimensional_Spiral
    {
        public enum SpiralDirection { right, left, up, down};

        public void MySpiral(int row, int column)
        {
            int ThisState = (int)SpiralDirection.right;
            int[,] Spiral = new int[row, column];
            int y = 0, x = -1;

            // Start of the navigation
            for (int i = 1; i <= row*column; i++)
            {
                switch (ThisState)
                {
                    case 0: // Right State
                    {
                        x++;

                            if(x == column ||Spiral[y,x] != 0) // The limit of the array in this direction is column
                            {                                  
                                x--;
                                y++;
                                ThisState = (int)SpiralDirection.down;
                            }
                        break;
                    }
                    case 1: // Left State
                    {
                        x--;

                            if (x == -1 || Spiral[y, x] != 0) // The limit of the array in this direction is -1
                            {
                                x++;
                                y--;
                                ThisState = (int)SpiralDirection.up;
                            }
                        break;
                    }

                    case 2: // Up State
                    {
                        y--;

                            if (y == -1 || Spiral[y, x] != 0) // The limit of the array in this direction is -1
                            {
                                x++;
                                y++;
                                ThisState = (int)SpiralDirection.right;
                            }
                        break;
                    }

                    case 3: // Down State
                    {
                        y++;

                            if (y == row || Spiral[y, x] != 0) // The limit of the array in this directon is Row
                            {
                                y--;
                                x--;
                                ThisState = (int)SpiralDirection.left;
                            }
                        break;
                    }
                }

                Spiral[y, x] = i; // Already in the right location so it equals the next number
            }
            //End of Navigation

            //Start of printing
            string MyArrayIs = row == column ? "The square array has: " : "The rectangular array has: ";
            int Elements = column * row;
            string ItHas = Elements + " Elements \n";
            string FinalString = MyArrayIs + ItHas;

            Console.WriteLine("\n");
            for (int i= 0; i <= row - 1; i++)
            {
                for (int j = 0; j <= column - 1; j++)
                {
                    Console.Write(Spiral[i, j] + " ");
                }
                Console.WriteLine();
            }
            Console.WriteLine(FinalString);
            //End of printing
        }
    }

    static class Program
    {
        static void Main(string[] args)
        {
            int Row;
            int Column;

            do
            {
                Console.WriteLine("Please enter an integer for number of rows");

            } while (!Int32.TryParse(Console.ReadLine(),out Row) || Row < 0);
    
            do
            {
                Console.WriteLine("Please enter an integer for number of columns");

            } while (!Int32.TryParse(Console.ReadLine(),out Column) || Column < 0);

            Bidimensional_Spiral A = new Bidimensional_Spiral();

            A.MySpiral( Row, Column);
            Console.ReadKey();
        }
    }
}

