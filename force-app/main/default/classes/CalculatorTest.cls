/**
 * INTRODUCTION TO APEX CODING CHALLENGE
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class CalculatorTest {
    //Create a method called Calculate that takes in a String in proper mathematical format (eg. 1 + 1) and returns the result.

    @isTest
    static void myUnitTest1() {
        Calculator.add(Calculator.multiply(2, 3), 1);
    }

    @isTest
    static void myUnitTest2() {
        Calculator.add(Calculator.multiply(2, 3), 3);
    }

    @isTest
    static void myUnitTest3() {
        productVal = Calculator.multiply(3, Calculator.add(4, 2));
        sumVal = Calculator.add(productVal, -8);
        Calculator.divide(Calculator.add(sumVal, 10), 2);
    }

    @isTest
    static void myUnitTest4() {
    }
}