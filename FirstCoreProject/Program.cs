using System;
using FirstLib;

namespace FirstCoreProject
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Arithematic a = new Addition(11, 10);
            System.Console.WriteLine(a.calculate());
            System.Console.WriteLine("Bye World");
            //Checking git poll
        }
    }
}
