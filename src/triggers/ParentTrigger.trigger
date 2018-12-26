trigger ParentTrigger on Parent__c (after insert, after update) {
    
    List<Child__c> childUpdLst = new List<Child__c>();
    for(Parent__c prnt : [select id,Parent_Values__c, (select Child_Values__c from Childs__r) from Parent__c where id in: trigger.newMap.keyset()]) {
        if(prnt.Parent_Values__c == '1' || prnt.Parent_Values__c == '2' || prnt.Parent_Values__c == '3') {
            for(Child__c child : prnt.Childs__r) {
                child.Child_Values__c = '';
                childUpdLst.add(child);
            }
        }
    }
    if(childUpdLst.size() > 0) {
        TriggerUtility.bypassChildVald = true;
        update childUpdLst;
    }
}