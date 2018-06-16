using System;
using System.Diagnostics;
using BusinessLogic;

namespace SonarQubeSample
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            // constants
            const int operandA = 1;
            const int operandB = 1;

            // calculation
            var result = new Calculator().Add(operandA, operandB);

            // result
            Console.WriteLine($"{operandA} + {operandA} = {result}");

            Console.WriteLine("--- Press Key ---");
            Console.ReadLine();
        }
    }
}
