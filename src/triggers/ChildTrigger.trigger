trigger ChildTrigger on Child__c (before insert, before update) {
    set<Id> parentIds  = new set<Id>();
    for(Child__c child : trigger.new){
        parentIds.add(child.Parent__c);
    }
    Map<Id,Parent__c> parentMap = new Map<Id,Parent__c>(
        [select Parent_Values__c from Parent__C where id in : parentIds]
    );
    for(Child__c child : trigger.new){
        if(parentMap.get(child.parent__c).Parent_Values__c == '1' && child.Child_Values__c != '1a' && child.Child_Values__c != '1b'
                && child.Child_Values__c != '1c'&& !TriggerUtility.bypassChildVald ){
                    child.addError('You can select only 1a or 1b or 1c.');
                }
                
        else  if(parentMap.get(child.parent__c).Parent_Values__c == '2' && child.Child_Values__c != '2a' && child.Child_Values__c != '2b'
                && child.Child_Values__c != '2c'&& !TriggerUtility.bypassChildVald ){
                    child.addError('You can select only 2a or 2b or 2c.');
                }
                
        else if(parentMap.get(child.parent__c).Parent_Values__c == '3' && child.Child_Values__c != 'Others' && 
        !TriggerUtility.bypassChildVald){
            child.addError('You can select only Others');
        }
    }       
        
}