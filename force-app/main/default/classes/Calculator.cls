public with sharing class Calculator {
    public Calculator() {
    }
        
    public static Integer add(Integer a, Integer b) {  
        return a + b;
    }

        
    public static Integer multiply(Integer a, Integer b) { 
        Integer product = 0;
        for (Integer i = 0; i < b; i++) {   
            product = product + a;
        }
        return product;
    }

        
    public static Decimal divide(Integer a, Integer b) { 
        Integer quotient = 0;
        Integer count = 0;
        
        for (Integer i = 0; i < b; i++) {   
            quotient = quotient - a;     
            count++;    
        }  
        return count;     
    }
        
      
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