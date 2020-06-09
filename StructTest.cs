using System;

namespace PeopleData
{
    struct PeopleInfo{
        public string Name;
        public string LastName;
        public int    Age;
        public string Gender;
        public string FullName;

        public void GetInfo()
        {
            
            Console.WriteLine("Ingrese su nombre:");
            Name = Console.ReadLine();

            Console.WriteLine("Ingrese su apellido:");
            LastName = Console.ReadLine();

            Console.WriteLine("Ingrese su edad:");
            Age = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Ingrese su sexo:");
            Gender = Console.ReadLine();

            FullName = Name + LastName;
    
        }
    }    
    class ExecuteInfo
    {
        static void Main(string[] args)
        {
            PeopleInfo Person1 = new PeopleInfo();
            PeopleInfo Person2 = new PeopleInfo();

            Console.WriteLine("Ingrese los datos de la primera person:");
            Person1.GetInfo();

            Console.WriteLine("Ingrese los datos de la segunda persona");
            Person2.GetInfo();

            Console.WriteLine("Los datos de la primera persona son:\nNombre: {0}\nEdad: {1}\nSexo: {2}", Person1.FullName, Person1.Age, Person1.Gender);

            Console.WriteLine("Los datos de la segunda persona son:\nNombre: {0}\nEdad: {1}\nSexo: {2}", Person2.FullName, Person2.Age, Person2.Gender);
            Console.ReadKey();
        }
    }
    
}
