using System;

namespace WavesApplication
{
    class Wave
    {
        //Declaramos variables

        public double Period;
        public double Wavelenght;
        public double Frequency { get; set; }
        public double Displacement { get; set; }
        public double Amplitude { get; set; }

        //Metodo usado para permitir al usuario ingresar valores
        public void GetParameters()
        {
            Console.WriteLine("Ingrese el tiempo que tarda en completar un ciclo la onda sonora en segundos:");
            Period = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Ingrese el tamaño de longitud de onda en metros de la segunda onda:");
            Wavelenght = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Ingrese el desfase de la onda:");
            Displacement = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("Ingrese la amplitud de la onda:");
            Amplitude = Convert.ToDouble(Console.ReadLine());
        }

        //Obtener velocidad de onda
        public double GetVelocity()
        {
            return (Wavelenght / Period);
        }

        //Obtener frecuencia apartir del periodo
        public double GetFrequency()
        {
            Frequency = (1 / Period);
            return Frequency;
        }

        //Se determina si la onda es audible o no por el ser humano
        public void Audible()
        {
            if (Frequency >= 16 && Frequency <= 20000)
            {
                Console.WriteLine("La frecuencia de la primera onda es audible por el ser humano\n");
            }
                else if (Frequency > 20000)
                {
                Console.WriteLine("La frecuencia de la primera onda es ultrasonica, es inaudible por el ser humano\n");
                }
                    else if (Frequency < 16)
                    {
                    Console.WriteLine("La frecuencia de la primera onda es infrasonica, es inaudible por el ser humano\n");
                    }

        }

        public double WavesFrequency;

        public double FinalFrequency(double FrequencyA, double FrequencyB)
        {
        WavesFrequency = ((FrequencyA + FrequencyB)/2);
        return WavesFrequency;
        }

        public double GetY(double Amp, double Fre, double Displa, int Degrees){
            return Amp * Math.Sin(2 * Math.PI * Fre * Degrees + Displa);
        }

    }
    class ExecuteWave{   

        

        public static void Main(string[] args)
        {   int Decision;
            Wave A = new Wave();
            Wave B = new Wave();
            Wave C = new Wave();

            A.GetParameters();
            B.GetParameters();

            Console.WriteLine (("La velocidad de la primera onda es: {0}\n"),A.GetVelocity().ToString("0.00"));
            Console.WriteLine (("La frecuencia de la primera onda es: {0}\n"),A.GetFrequency().ToString("0.00"));

            A.Audible();

            Console.WriteLine (("La velocidad de la segunda onda es: {0}\n"),B.GetVelocity().ToString("0.00"));
            Console.WriteLine (("La frecuencia de la segunda onda es: {0}\n"),B.GetFrequency().ToString("0.00"));

            B.Audible();

            C.FinalFrequency(A.Frequency, B.Frequency);

            Console.WriteLine(("La frecuencia final es: {0}\n"), C.WavesFrequency.ToString("0.00"));
            Console.WriteLine("¿Cual de las ondas desea ver su dibujado?\n 1.Primera\n 2.Segunda\nPresione cualquier numero para salir del programa");

            Decision = Convert.ToInt32(Console.ReadLine());
            
                switch (Decision)
                {
                    case 1:
                        for(int Deg = 0; Deg < 360; Deg++ )
                        {
                            A.GetY(A.Amplitude, A.Frequency, A.Displacement, Deg);
                            Console.WriteLine("Los valores de x son: {0}", Deg.ToString("0.00"));
                            Console.WriteLine("Los valores de y son: {0}", A.GetY(A.Amplitude, A.Frequency, A.Displacement, Deg).ToString("0.00"));
                        }
                        break;
                    case 2:
                        for(int Deg = 0; Deg < 360; Deg++ )
                        { 
                            B.GetY(B.Amplitude, B.Frequency, B.Displacement, Deg);
                            Console.WriteLine("Los valores de x son: {0}", Deg.ToString("0.00"));
                            Console.WriteLine("Los valores de y son: {0}", B.GetY(B.Amplitude, B.Frequency, B.Displacement, Deg).ToString("0.00"));
                        }
                        break;
                }   

            Console.ReadLine();
        }
    }

}