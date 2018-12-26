global class Batch_testBatch implements Database.Batchable<sObject>, Database.Stateful{
           
    global database.Querylocator start(Database.BatchableContext BC){
       
            return database.getQuerylocator([SELECT Id FROM Account]);
        
    }
    
    global void execute(Database.BatchableContext BC, List<Account> scope){
        List<Account> accLst = new List<Account>();
        for(Account acc: scope){
            Account a = new Account(id=acc.id);
            accLst.add(a);
        }
        if(accLst.size()>0){
          //  update accLst;
        }
    }
     
    global void finish(Database.BatchableContext BC){
        system.debug('inside finsh method');
        system.debug('limit='+system.Limits.getFutureCalls());
        system.debug('allowed='+system.Limits.getLimitFutureCalls());
      // AccountTriggerHandler.methodInvoke();
      Batch_testBatch1 bt = new Batch_testBatch1();
        database.executeBAtch(bt);
    }
}