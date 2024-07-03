public with sharing class SingleAccountVF {

    //Challenge I: Create a Visualforce page that displays a single Account, specified as a parameter in the URL.
    private Account acc;
    private ID accId{get; set;}

    public ApexPages.StandardSetController setAcc {
        get {
            if(setAcc == null) {
                setAcc = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Name FROM Account]));
            }
            return setAcc;
        }
        set;
    }

    public Account getSingleAccount() {
        return [SELECT Id, Name, Phone, Type, OwnerId FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }

    /*Challenge III: Modify your Visualforce page to display a single Account, 
    but this time the Account should always be the same, regardless of the parameter in the URL. 
    You may not use a Standard Controller.
    */

    public PageReference save() {
        update acc;
        return null;
    }
}