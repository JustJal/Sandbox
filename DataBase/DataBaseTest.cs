using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBaseApplication
{
    struct FootballData
    {
        public string TeamName;
        public string CaptainName;
        public int    Goals;
        public string Country;
        public string GameResult;
        public void GetData()
        {

            Console.WriteLine("Ingrese el nombre del equipo:");
            TeamName = Console.ReadLine();

            Console.WriteLine("Ingrese el pais del equipo:");
            Country = Console.ReadLine();

            Console.WriteLine("Ingresa el nombre del capitan:");
            CaptainName = Console.ReadLine();

            Console.WriteLine("Ingresa la cantidad de goles anotados:");
            Goals = Convert.ToInt16(Console.ReadLine());

            Console.WriteLine("¿El equipo fue ganador o perdedor?");
            GameResult = Console.ReadLine();
        }
    }
    class ExecuteData
    {
        static void Main(string[] args)
        {
            string path = @"C:\Users\astef_000\Desktop\Jalinson\Programming\Sandbox\DataBase\DataBase.txt";

            FootballData Team = new FootballData();

            Console.WriteLine("Bienvenido! En este programa puede mantener una base de datos con informacion acerca de su equipo favorito\nIngrese la informacion que se le pide acontinuacion:");
            Team.GetData();

            using (StreamWriter sr = File.AppendText(path))
            {
                sr.WriteLine("El nombre del equipo es: {0}", Team.TeamName);
                sr.WriteLine("El nombre del capitan es: {0}",Team.CaptainName);
                sr.WriteLine("El equipo anoto: {0} goles",Team.Goals);
                sr.WriteLine("El equipo es procedente de: {0}",Team.Country);
                sr.WriteLine("El equipo fue: {0}", Team.GameResult);
                sr.Close();
            }
            Console.ReadKey();
        }
    }
}