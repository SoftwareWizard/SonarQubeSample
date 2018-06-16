using System;
using System.Diagnostics;
using BusinessLogic;

namespace SonarQubeSample
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            const int operandA = 1;
            const int operandB = 1;

            var result = new Calculator().Add(operandA, operandB);

            Console.WriteLine($"{operandA} + {operandA} = {result}");

            Console.WriteLine("--- Press Key ---");
            Console.ReadLine();
        }
    }
}
