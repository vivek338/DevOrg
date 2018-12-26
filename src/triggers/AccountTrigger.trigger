trigger AccountTrigger on Account (after insert, before update, after update, after delete, after undelete) {
    
    system.debug('inside acc trigger');
    system.debug(trigger.new);
    system.debug(trigger.old);
    if(Trigger.isBefore && trigger.isUpdate){
        for(Account acc: trigger.new){
            acc.AccountNumber='54321';
          //  acc.vivek338__extidAcc__c='1231';
        }
    }
 //   AccountTriggerHandler.methodInvoke();
    /*
    if(!MetaDataConstants.AccountTriggerRecursiveCheck){
    RollupSummaryClass.RollupMethod(trsigger.new, trigger.old, 'Opportunities', 'vivek338__Total_Opportunity_Amount__c', 'Amount', 
                             trigger.isInsert, trigger.isUpdate, trigger.isDelete, trigger.isUndelete);
    }
*/
}