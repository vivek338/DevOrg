trigger casetrigger on Case (before insert) {
    for(case c: trigger.new){
        system.debug('c.ownerformula='+c.vivek338__caseownerid__c);
    }
}