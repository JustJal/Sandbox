using System;


namespace Salary
{
    class ArrayOfSalary
    {
        public static void Main(string[] args)
        {
            double[] Salaries = {232.2, 23245.32, 43543.34, 3242.2, 25234.234};

            int Salary;

            Console.WriteLine("Escoja el salario a mostrar: Numeros del 1 al 5");
            Salary = Convert.ToInt32(Console.ReadLine());

            switch(Salary)
            {
                case 1:
                    Console.WriteLine("El salario es: {0}", Salaries[0]);
                    break;
                case 2:
                    Console.WriteLine("El salario es: {0}", Salaries[1]);
                    break;
                case 3:
                    Console.WriteLine("El salario es: {0}", Salaries[2]);
                    break;
                case 4:
                    Console.WriteLine("El salario es: {0}", Salaries[3]);
                    break;
                case 5:
                    Console.WriteLine("El salario es: {0}", Salaries[4]);
                    break;
            }
            Console.ReadLine();
        }
    
    }
}