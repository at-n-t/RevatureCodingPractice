//SOQL, SOSL, and DML Coding Challenge
public with sharing class DataLord {
    public DataLord() {

    }
    //SOQL
    //Challenge I: Write a class called DataLord that has 1 method called NumAccounts. This method should return the number of Accounts that exist in org.
    public Integer NumAccounts() {
        return [SELECT COUNT() FROM Account];
    }
    
    //Challenge II: Write a method called NumHot. This method should return the number of Accounts with a Rating of Hot.
    public Integer NumHot() {
        return [SELECT COUNT() FROM Account WHERE Rating = 'Hot'];
        
    }
    
    //Challenge III: Write a method called NumComplex. This method should return the number of Accounts that have an ampersand (&) in the Name.
    public Integer NumComplex() {
        return [SELECT COUNT() FROM Account WHERE Name LIKE '%&%'];
        
    }
    
    //Challenge IV: Write a method called BigFive. This method should return the top 5 Accounts in terms of Annual Revenue. You may only use 1 line of code for the method body.
    public List<Account> BigFive() {
        return [SELECT Name, AnnualRevenue FROM Account ORDER BY AnnualRevenue DESC limit 5];
        
    }
    
    //Challenge V: Write a method called LastBigOpportunity. This method should return the Opportunity with the most recent Close Date that had an Amount over $100,000.
    public Opportunity LastBigOpportunity() {
        return [SELECT Name, CloseDate, Amount FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC limit 1];
    }
    
    //Challenge VI: Write a method called MajorPlayers. This method should return all Contacts that are associated to an Account with a Rating of Hot.
    public List<Account> MajorPlayers() {
        return [SELECT Account.Name, (SELECT Contact.Name FROM Account.Contacts) FROM Account WHERE Rating = 'Hot'];
    }

    /*Elite Challenge I: Write a method called MostPopularAccount. This method should return the Account Name that has the most associated Contacts.
    public List<Account> MostPopularAccount(String ContactId) {
        return [SELECT Account.Name FROM Account ORDER BY COUNT(Contacts) DESC limit 1];
    }*/

    
    //SOSL
    //Challenge I: Write a method to retrieve all Contacts and Leads that are named Tom.
    public static List<List<sObject>> findTom() {
        List<List<sObject>> searchTom = [FIND 'Tom' IN Name FIELDS RETURNING Contact, Lead];
        return searchTom;
    }

    //Challenge II: Write a method to retrieve all Accounts that have an 'a' and an 'o' in one of their fields.
    public static List<List<sObject>> findAO() {
        List<List<sObject>> searchAO = [FIND 'a and o' IN NAME FIELDS RETURNING Account(Name)]; //Check
        return searchAO;
    }

    //Elite Challenge I: Robin knows that there is a phone number that ends in 1000, but as no idea which field it is in. They know it is either on an Account, Contact, or Lead and just need the Name.
    public static List<List<sObject>> findPhone() {
        List<List<sObject>> searchPhone = [FIND '1000' IN Phone FIELDS RETURNING Account(Name), Contact(Name), Lead(Name)];
        return searchPhone;
    }


    //DML
    //Challenge I: Write a method called SpawnContacts that creates and inserts 200 uniquely named Contacts into the database.
    public static void SpawnContacts() {
        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < 200; i++) {
            Contact c = new Contact(LastName = 'Contact ' + i);
            contactList.add(c);
        }
        Database.insert(contactList);
    }

    //Challenge II: Write a method called CreateHomes that creates and inserts 3 uniquely named Accounts into the database.
    public static void CreateHomes() {
        List<Account> homeList = new List<Account>();
        for (Integer i = 0; i < 3; i++) {
            Account a = new Account(Name = 'Account ' + i);
            homeList.add(a);
        }
        Database.insert(homeList);
    }

    //Challenge III: Write a method called Relocate that deletes the 50 most recent Contacts in the database.
    public static void Relocate() {
        List<Contact> relocateList = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 50];
        Database.delete(relocateList);
    }

    //Challenge IV: Write a method called AssignHomes that relates all Contacts created in these challenges the 3 Accounts randomly.
    public static void assignHomes() {
        try {
            SpawnContacts();
            CreateHomes();
            List<Account> accountHomeList = [SELECT Id FROM Account ORDER BY CreatedDate DESC LIMIT 3];
            List<Contact> contactHomeList = [SELECT Id FROM Contact ORDER BY CreatedDate DESC LIMIT 200];
            for (Contact c : contactHomeList) {
                Integer random = Integer.valueof((Math.random() * 3));
                c.AccountId = accountHomeList[random].Id;
            }
            Database.update(contactHomeList);
        } catch (DmlException e) {
            System.debug('The following exception has occurred: ' + e.getMessage());
        }
    }
}