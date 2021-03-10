using System;

namespace CensorApp
{ 
    class CensorApp
    {
        char[] Array;
        string Sentence { get; set; }
        public string Censor(string Sentence)
        {
            Array = Sentence.ToCharArray();

            for (int i = 1; i<Sentence.Length-1; ++i)
            {
                Continue:
                    if (Array[i] == ' ')
                    {
                        Array[i] = ' ';
                        i++;
                        goto Continue;
;                   }
                Array[i] = '*';           
                     
            }
            return this.Sentence = new string(Array);
        }
        static void Main(string[] args)
        {
            CensorApp CA = new CensorApp();
            CA.Censor(Console.ReadLine());
            Console.WriteLine("Your Censored string is " + CA.Sentence);
        }
    }
}
