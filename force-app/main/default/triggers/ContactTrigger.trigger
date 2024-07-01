trigger ContactTrigger on Contact (before insert, after update) {
    switch on Trigger.operationType {
        //Challenge II: Create a trigger to set a default value for Email on Contacts that are inserted without one.
        when BEFORE_INSERT {
            ContactHelper.SetEmailDefault(Trigger.new);
        }
        /*Challenge IV: Create a trigger to update the phone field of the related Account when a Contact's phone field is updated. 
        The Account and Contact should end up having the same value in their phone fields.
        */
        when AFTER_UPDATE {
            ContactHelper.UpdateRelatedAccount(Trigger.old);
        }
    }

}