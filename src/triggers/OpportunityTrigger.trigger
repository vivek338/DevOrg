trigger OpportunityTrigger on Opportunity (after insert, after update, after delete, after undelete) {

   /* 
    system.debug(trigger.new);
    system.debug(trigger.old);
    
    RollupClass.RollupMethod(trigger.new, trigger.old, 'Account', 'AccountId', 'vivek338__Total_Opportunity_Amount__c', 'Amount', 
                             trigger.isInsert, trigger.isUpdate, trigger.isDelete, trigger.isUndelete);
*/
}