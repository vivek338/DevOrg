global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
       // List<Lead> leadLst = [Select Id, LeadSource from Lead];
        return Database.getQueryLocator('Select Id, LeadSource from Lead');
    } 
    
    global void execute(Database.BatchableContext bc, List<Lead> leadLst){
        system.debug('inbatch');
        List<Lead> ldToUpd = new List<Lead>();
        for(Lead ld: leadLst){
            ld.LeadSource ='Dreamforce';
            ldToUpd.add(ld);
        }
        if(!ldToUpd.isEmpty())
            update ldToUpd;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }

}