trigger AccountTrigger on Account (before delete, after insert) {
    switch on Trigger.operationType {
         //Challenge I: Create a trigger to prevent the deletion of Accounts with Contacts.
        when BEFORE_DELETE {
            AccountHelper.PreventAccountDeletion(Trigger.old);
        }
        //Challenge III: Create a trigger to create new related Contact when an Account is inserted.
        when AFTER_INSERT {
            AccountHelper.CreateRelatedContact(Trigger.new);
        }

    }
}