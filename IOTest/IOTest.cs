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
            String path = @"C:\Users\astef_000\Desktop\Jalinson\Programming\Sandbox\IOTest\Test.txt";

            using (StreamReader sr = File.OpenText(path))
            {
                String s = "";

                while ((s = sr.ReadLine()) != null)
                {
                    Console.WriteLine(s);
                }
            }
            Console.ReadKey();
        }
    }
}