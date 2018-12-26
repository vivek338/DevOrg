trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
/*
    List<Task> tskLst = new List<Task>();
    List<opportunity> oppLst = [SELECT id, StageName from OPPORTUNITY where StageName='Closed Won' AND ID in :Trigger.new];
    For(Opportunity opp : trigger.new){
        if(Trigger.isInsert || trigger.oldMap.get(opp.id).StageName != opp.StageName){
            Task tsk = new Task();
            tsk.Subject = 'Follow Up Test Task';            
            tsk.WhatId = opp.id;
            tskLst.add(tsk);
        }
        
    }
    if(tskLst.size()!=null && tskLst.size()>0){
        insert tskLst;
    }
*/
}