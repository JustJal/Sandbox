using System;

namespace RootsApplication{
    class Roots{

        //Member variables
        double A;
        double B;
        double C;
        double Discriminante;
        double Raiz1; 
        double Raiz2;
        bool   Disc;

        public void Constantes(){
            
            //Give it the variables
            Console.WriteLine("Ingrese la constante de X^2:");    
             A = Convert.ToDouble(Console.ReadLine());
        
            Console.WriteLine("Ingrese la constante de X:");
             B = Convert.ToDouble (Console.ReadLine());

            Console.WriteLine("Ingrese el termino independiente:");
             C = Convert.ToDouble (Console.ReadLine());

            Console.WriteLine("Tu polinomio es {0}X^2 +({1}X) +({2})", A, B, C);

        }
        public double Raices(){
            //Now ill see if it is imaginary or not
            double Cuad;
            double RaizC;
            Cuad = Math.Pow (B,2);
            Discriminante = (Cuad - (4 * A * C));
           
            if (Discriminante > 0)
            {
            RaizC = Math.Sqrt(Discriminante);
            Raiz1 = ((-B + RaizC)/(2 * A));
            Raiz2 = ((-B - RaizC)/(2 * A));
            Disc = true;
            }
            return Discriminante;
        }
        public void DisplayRoots(){
            if (Disc == true)
            {
                Console.WriteLine("Las raices de tu polinomio son:{0}, {1}", Raiz1, Raiz2);
                return;
            }
            Console.WriteLine("La discriminante de tu polinomio es: {0}\nPor lo tanto sus raices son imaginarias",Discriminante);
        }

    } 
    class ExecuteProgram{
        static void Main(string[] args){
            Roots r = new Roots();
            r.Constantes();
            r.Raices();
            r.DisplayRoots();
            Console.ReadLine();
        }  
    }
}     
