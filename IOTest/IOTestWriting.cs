using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoApplication
{
    class Test
    {
        static void Main(string[] args)
        {
            string AddLine;
            string path = @"C:\Users\astef_000\Desktop\Jalinson\Programming\Sandbox\IOTest\Test.txt";

            Console.WriteLine("Ingrese la frase a agregar:");
            AddLine = Console.ReadLine();

            using (StreamWriter sr = File.AppendText(path))
            {
                sr.WriteLine(AddLine);
                sr.Close();

                Console.WriteLine(File.ReadAllText(path));
            } 
            Console.ReadKey();
        }
    }
} 