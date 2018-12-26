global class Batch_To_Update_Opportunity_To_offfices implements Database.Batchable<sObject>, Database.AllowsCallouts{
    
    global List<contact> start(Database.BatchableContext BC)
    {
        system.debug('in start;');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response='+response.getBody());
        List<Account> acclst = [Select id,(select id from contacts) from Account limit 10];
     return acclst[0].contacts;
    }
    
    global void execute(Database.BatchableContext BC, List<SObject> scp) {
        system.debug('scp='+scp);
        system.debug('in execute;');
    }
    
     global void finish(Database.BatchableContext BC) {
         system.debug('in finish;');
         AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email 
                       from AsyncApexJob where Id =:BC.getJobId()];
          
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
            mail.setSubject('Record Insert From API CampaignMember ' + a.Status);
            mail.setPlainTextBody('records processed ' + a.TotalJobItems + 'with '+ a.NumberOfErrors + ' failures.');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
 
     }
}