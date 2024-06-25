public with sharing class BatchableApex implements Database.Batchable<sObject> {
    public BatchableApex() {

    }

    //Create batchable apex that will delete stale Account records.
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([Select Id, (SELECT Id, CloseDate FROM Opportunities WHERE CloseDate < LAST_N_MONTHS:6) FROM Account]);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope) {
        delete scope;
    }

    public void finish(Database.BatchableContext bc) {
    }
}