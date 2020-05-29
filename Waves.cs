using System;

namespace WavesApplication{
     class WaveA{

        //Declaramos variables

        public double PeriodA;
        public double WaveLenghtA;
        public double FrequencyA;

            //Metodo usado para permitir al usuario ingresar valores
            public void GetParametersA(){

                Console.WriteLine("Ingrese el tiempo que tarda en completar un ciclo la primera onda sonora en segundos:");
                PeriodA = Convert.ToDouble(Console.ReadLine());

                Console.WriteLine("Ingrese el tamaño de longitud de onda en metros de la segunda onda:");
                WaveLenghtA = Convert.ToDouble(Console.ReadLine());
            }

            //Obtener velocidad de onda
            public double GetVelocityA(){
                return (WaveLenghtA / PeriodA);
            }

            //Obtener frecuencia apartir del periodo
            public double GetFrequencyA(){
                FrequencyA = (1 / PeriodA);
                return FrequencyA;
            }

            //Se determina si  la onda es audible o no por el ser humano
            public void AudibleA(){

                if (FrequencyA >= 16 && FrequencyA <= 20000) {
                    Console.WriteLine("La frecuencia de la primera onda es audible por el ser humano\n");
                }

                 else if (FrequencyA > 20000){
                    Console.WriteLine("La frecuencia de la primera onda es ultrasonica, es inaudible por el ser humano\n");
                }

                    else if (FrequencyA < 16) {
                        Console.WriteLine("La frecuencia de la primera onda es infrasonica, es inaudible por el ser humano\n");
                }   
                
            }
    } 
    class WaveB {

        //Esta clase se podria decir que es un homologo de la clase anteriormente descrita

        public double PeriodB;
        public double WaveLenghtB;
        public double FrequencyB;

            public void GetParametersB(){
                Console.WriteLine("Ingrese el tiempo que tarda en completar un ciclo la segunda onda sonora en segundos:");
                PeriodB = Convert.ToDouble(Console.ReadLine());

                Console.WriteLine("Ingrese el tamaño de longitud de onda en metros de la segunda onda:");
                WaveLenghtB = Convert.ToDouble(Console.ReadLine());
            }

            public double GetVelocityB(){
                return (WaveLenghtB / PeriodB);
            }

            public double GetFrequencyB(){
                FrequencyB = (1/PeriodB);
                return FrequencyB;
            }

            public void AudibleB(){

                if (FrequencyB >= 16 && FrequencyB <= 20000) {
                    Console.WriteLine("La frecuencia de la segunda onda es audible por el ser humano\n");
                }

                 else if (FrequencyB > 20000){
                    Console.WriteLine("La frecuencia de la segunda onda es ultrasonica, es inaudible por el ser humano\n");
                }
                
                    else if (FrequencyB < 16) {
                        Console.WriteLine("La frecuencia de la segunda onda es infrasonica, es inaudible por el ser humano\n");
                }   
            }
    }

    class Waves{

        public double FinalFrequency;

        //Obtenemos la frecuencia final de ambas ondas
         public double GetFinalFrequency(){
            WaveA A = new WaveA();
            WaveB B = new WaveB();
            A.GetFrequencyA();
            B.GetFrequencyB();

            FinalFrequency = ((A.FrequencyA + B.FrequencyB)/2);
            return FinalFrequency;
        }

        //Determinamos si es audible por el ser humano
        public void FinalAudible(){

                if (FinalFrequency >= 16 && FinalFrequency <= 20000) {
                    Console.WriteLine("La frecuencia de la onda final es audible por el ser humano\n");
                }

                 else if (FinalFrequency > 20000){
                    Console.WriteLine("La frecuencia de la onda final es ultrasonica, es inaudible por el ser humano\n");
                }
                
                    else if (FinalFrequency < 16) {
                        Console.WriteLine("La frecuencia de la onda final es infrasonica, es inaudible por el ser humano\n");
                }   
                
         }
    }
    class ExecuteWaves {
        static void Main (string[] args){

            WaveA A = new WaveA(); //Convertimos las clases a objetos
            WaveB B = new WaveB();
            Waves S = new Waves();

                 A.GetParametersA();

                 Console.WriteLine("La velocidad de la primera onda es: {0}\n", A.GetVelocityA());
                 Console.WriteLine("La frecuencia de la primera onda es: {0}\n", A.GetFrequencyA());

                 A.AudibleA();
                 
                 B.GetParametersB();

                 Console.WriteLine("La velocidad de la segunda onda es: {0}\n", B.GetVelocityB());
                 Console.WriteLine("La frecuencia de la segunda onda es: {0}\n", B.GetFrequencyB());

                 B.AudibleB();
                 
                 Console.WriteLine("La frecuencia final de las ondas superpuestas es: {0}", S.GetFinalFrequency());

                 S.FinalAudible();

                 Console.ReadLine();
            
        }
    }
}