public with sharing class ContactHelper {
    public ContactHelper() {

    }

    //Set a default value for Email on Contacts that are inserted without one.
    public static void SetEmailDefault(List<Contact> conList) {
        for(Contact con : conList) {
            if(String.isBlank(con.Email))
            {
                con.Email = con.FirstName + '.' + con.LastName + '@email.com';
            }
        }
    }

    /*Create a trigger to update the phone field of the related Account when a Contact's phone field is updated.
    The Account and Contact should end up having the same value in their phone fields.
    */
    public static void UpdateRelatedAccount(List<Contact> conList) {
        List<Account> accList = [SELECT Id FROM Account];
        for (Contact c : conList) {
            for (Account a : accList) {
                a.Phone = c.Phone;

            }
        }
        update accList;
    }
}