//INTRODUCTION TO APEX CODING CHALLENGE
global with sharing class Calculator {
    public Calculator() {
    }
    
    //Challenge I: Create a class called Calculator with a single method called Add. This method should take 2 Integer parameters and return their sum.
    public static Integer add(Integer a, Integer b) {  
        return a + b;
    }

    /*Challenge II: Create a method called Multiply that takes 2 Integer parameters and returns their product. 
    You are not allowed to use the * operator to multiply the two Integers, and you must use your Add method you created in Challenge I.
    */
    public static Integer multiply(Integer a, Integer b) { 
        Integer product = 0;
        for (Integer i = 0; i < b; i++) {   
            product = product + a;
        }
        return product;
    }

    /*Challenge III: Create a method called Divide that takes 2 Integer parameters and returns their quotient (Parameter 1 / Parameter 2). 
    Once again, you are not allowed to use the / operator, and you must use your Add method. For this challenge, do not consider if zero is the divisor.

    Challenge IV: Modify your Divide method so that it will return 0 if zero is the divisor.
    */    
    public static Decimal divide(Integer a, Integer b) { 
        Integer quotient = 0;
        Integer count = 0;
        if (b == 0) {
            return 0;
        } else {
            for (Integer i = 0; i < b; i++) {   
                quotient = quotient - a;     
                count++;    
            }  
        return count;    
        } 
    }
        
    /*Challenge V: Create a method called Mod that takes 2 Integer parameters and returns their remainder. You are not allowed to use the Math.Mod() method.
    */    
    public static Decimal mod(Integer a, Integer b) {
        Integer quotient = 0;
        Integer count = 0;
        
        for (Integer i = 0; i < b; i++) {   
            quotient = quotient - a;     
            count++;    
        }  
        return quotient;   
    }
}