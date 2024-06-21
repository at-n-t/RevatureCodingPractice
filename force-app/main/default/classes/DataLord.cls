//DML AND SOQL CODING CHALLENGE
public with sharing class DataLord {
    public DataLord() {
    }
    //SOQL
    //Challenge I: Write a class called DataLord that has 1 method called NumAccounts. This method should return the number of Accounts that exist in org.
    public Integer NumAccounts() {
        return [SELECT COUNT() FROM Account];
    }
    
     //challenge II: Write a method called NumHot. This method should return the number of Accounts with a Rating of Hot.
    public Integer NumHot() {
        return [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
        
    }
    
    //Challenge III: Write a method called NumComplex. This method should return the number of Accounts that have an ampersand (&) in the Name.
    public Integer NumComplex() {
        return [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
        
    }
    
    //Challenge IV: Write a method called BigFive. This method should return the top 5 Accounts in terms of Annual Revenue. You may only use 1 line of code for the method body.
    public List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC limit 5 offset 8];
        
    }
    
    //Challenge V: Write a method called LastBigOpportunity. This method should return the Opportunity with the most recent Close Date that had an Amount over $100,000.
    public List<Opportunity> LastBigOpportunity() {
        return [SELECT Name FROM Opportunity WHERE Amount > 100000 AND CloseDate > n_months_ago: 2 AND closeDate < today];
    }
    
    
    //Challenge VI: Write a method called MajorPlayers. This method should return all Contacts that are associated to an Account with a Rating of Hot.
    public List<Account> MajorPlayers() {
        return [SELECT Account.Name, (SELECT Contact.Name FROM Account.Contacts) FROM Account WHERE Rating = 'Hot'];
    }

    //Challenge VI: Write a method called MostPopularAccount. This method should return the Account Name that has the most associated Contacts.
    public List<Account>MostPopularAccount(String ContactId){
        return [SELECT Account.Name FROM Account ORDER BY COUNT(Contacts) DESC limit 1];
    }
}