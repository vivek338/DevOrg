global class Batch_testBatch1 implements Database.Batchable<sObject>, Database.Stateful{
           
    global database.Querylocator start(Database.BatchableContext BC){
       
            return database.getQuerylocator([SELECT Id FROM contact]);
        
    }
    
    global void execute(Database.BatchableContext BC, List<contact> scope){
       
    }
     
    global void finish(Database.BatchableContext BC){
       system.debug('inside finsih method 1');
    }
}