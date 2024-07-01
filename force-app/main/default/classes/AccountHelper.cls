public with sharing class AccountHelper {
    public AccountHelper() {

    }
    
    public static List<Account> getAccounts(String search){  
        try {
            String sanitizedQ = String.escapeSingleQuotes(search);
            String q = '%' + sanitizedQ + '%';
            return [SELECT Name FROM Account WHERE Name LIKE :q];   
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    //Prevent deletion of Accounts with Contacts.
    public static void PreventAccountDeletion(List<Account> accList) {
        List<Account> accPrevent = [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Contact) AND Id IN :accList];
        for(Account a : accPrevent) {
             a.addError('Cannot delete Accounts with Contacts.');
        }
    }
    //Create a trigger to create new related Contact when an Account is inserted.
    public static void CreateRelatedContact(List<Account> accList) {
        List<Contact> cList = new List<Contact>();
        for (Account a : accList) {
            Contact c = new Contact(LastName = a.Name + ' Contact', AccountId = a.Id);
            cList.add(c);
        }
        insert cList;
    }

    //Create a trigger to update the same related Contact for each Account that is inserted or updated.
    public static void UpdateRelatedContact(List<Account> accList) {
        List<Contact> cList = [SELECT Phone FROM Contact];
        for (Account a : accList) {
            for (Contact c : cList) {
                c.Phone = a.Phone;
            }
        }
        update cList;
    }
}