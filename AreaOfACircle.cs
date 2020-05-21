using System; 

namespace DeclaringConstants {
    class Program{
        static void Main (string[] args){
            const double pi = 3.14159;

            //Constant Declaration

            double r;
            Console.WriteLine ("Enter Radius: ");
            r = Convert.ToDouble(Console.ReadLine());
            
            double areaCircle = pi * r * r;
            Console.WriteLine ("Radius: {0} \nArea: {1}", r, areaCircle);
            Console.ReadLine();        
        }
    }
}
