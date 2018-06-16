using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BusinessLogic.Test
{
    [TestClass]
    public class CalculatorTest
    {
        [TestMethod]
        public void Add_Works()
        {
            // arrange
            const int TestValueA = -1;
            const int TestValueB = 1;

            var testee = new Calculator();

            // act
            var result = testee.Add(TestValueA, TestValueB);

            // assert
            Assert.AreEqual(0, result);
        }
    }
}
