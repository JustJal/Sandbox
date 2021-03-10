using System;
using System.Collections.Generic;

namespace Hanged_Man
{
    class Hanged_Man
    {
        char[] SentenceSplit;
        List<char> LetterList = new List<char>();
        char[] SolutionSplit;
        string Sentence { get; set; }
        string Solution { get; set; }
        char Letter;
        int Lifes = 7;
        public string Censor(string Sentence)
        {
            this.Sentence = Sentence.ToLower();
            SentenceSplit = this.Sentence.ToCharArray();
            Solution = Sentence.ToLower();

            for (int i = 1; i < Sentence.Length - 1; ++i)
            {
                if (SentenceSplit[i] == (' ') || 
                    SentenceSplit[i] == SentenceSplit[Sentence.Length - 1] || 
                    SentenceSplit[i] == SentenceSplit[0])
                {
                   continue;
                }
                SentenceSplit[i] = '_';
            }
            return this.Sentence = new string(SentenceSplit);
        }
        public string UnCensor(string Sentence, char Letter)
        {
            SolutionSplit = Sentence.ToCharArray();

            for(int i = 1; i<Sentence.Length; ++i)
            {
                if (Solution.Contains(Letter))
                {
                    if (SolutionSplit[i] == Letter)
                    {
                        SentenceSplit[i] = Letter;
                    }
                }
            }
            return this.Sentence = new string(SentenceSplit);
        }
        public void LetterCounter(Char a)
        {
            LetterList.Add(a);
        }
        public string LifeIndicator()
        {
            switch (Lifes)
            {
                case 6:
                    return "You";
                case 5:
                    return "You are";
                case 4:
                    return "You are now";
                case 3:
                    return "You are now a";
                case 2:
                    return "You are now a Hanged";
                case 1:
                    return "YOU ARE NOW A HANGED";
                case 0:
                    return "YOU ARE NOW A HANGED M A N";
                default:
                    return "You are still safe mate";
            }
        }
        public bool StillAlive(int lifes)
        {
                if (Lifes == 0)
                    return false;

            return true;
        }
        public void LostIt(char a)
        {
            if (LetterList.Contains(a)|| 
                !Solution.Contains(a))
            {
                Lifes--;
            }
            
        }
        static void Main(string[] args)
        {
            Hanged_Man LetsPlay = new Hanged_Man();

            Console.WriteLine("Hello, please introduce one or more words to start the game");
            LetsPlay.Censor(Console.ReadLine());

            Console.WriteLine("That's okay, please press a key to start the game");
            Console.ReadKey();
            Console.Clear();

            while (LetsPlay.Solution != LetsPlay.Sentence)
            {
                Console.WriteLine(LetsPlay.Sentence);
                Console.WriteLine(LetsPlay.LifeIndicator());
                Console.WriteLine("Please enter a letter");

                do
                {
                    Char.TryParse(Console.ReadLine(),out LetsPlay.Letter);
                }
                while (!Char.IsLetter(LetsPlay.Letter));

                LetsPlay.LostIt(LetsPlay.Letter);
                LetsPlay.LetterCounter(LetsPlay.Letter);
                LetsPlay.UnCensor(LetsPlay.Solution, LetsPlay.Letter);
                LetsPlay.StillAlive(LetsPlay.Lifes);

                if (LetsPlay.Lifes == 0)
                    break;

            }

            Console.Clear();

            if (LetsPlay.StillAlive(LetsPlay.Lifes) == false)
            {
                Console.WriteLine("YOU ARE NOW A HANGED MAN");
                Console.WriteLine("The word or sentence was: " + LetsPlay.Solution);
                Console.ReadKey();
                Environment.Exit(0);
            }
               
            Console.WriteLine("You Won!");
            Console.ReadKey();
        }
    }
}
