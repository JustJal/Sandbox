using System;

namespace RectangleApplication {
    class Rectangle {
        //Member variables
        private double length;
        private double width;

        public void AcceptDetails(){
            Console.WriteLine ("Enter Length: ");
            length = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine ("Enter Width");
            width = Convert.ToDouble(Console.ReadLine());
        }
        public double GetArea(){
            return length * width;
        }
        public void Display(){
            Console.WriteLine("Lenght: {0}", length);
            Console.WriteLine("Width: {0}", width);
            Console.WriteLine("Area: {0}", GetArea());
        }
    }//End Class Rectangle

    class ExecuteRectangle {
        static void Main (string[] args){
            Rectangle r = new Rectangle ();
            r.AcceptDetails();
            r.Display();
            Console.ReadLine();
        }
    }
}