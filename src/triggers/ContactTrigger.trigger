trigger ContactTrigger on Contact (before insert, before update, after delete, after insert, after undelete, after update) {
   
        /*set<Id> accIds = new set<Id>();
        for(Contact con : trigger.isDelete ? trigger.old : trigger.new){
            accIds.add(con.AccountId);
        }
        List<Account> accUpdLst = new List<Account>();
        for(Account acc : [select Id, (select Age__c from Contacts) from Account where Id in : accIds]){
            acc.Below_18__c =0;
            acc.X18_30__c =0;
            acc.X31_59__c=0;
            acc.X60__c=0;
            for(Contact con : acc.Contacts){
                if(con.Age__c<18)
                    acc.Below_18__c++;
                else if(con.Age__c>=18 && con.Age__c<=30)
                    acc.X18_30__c++;
                else if(con.Age__c>=31 && con.Age__c<=59)
                    acc.X31_59__c++;
                else if(con.Age__c>60)
                    acc.X60__c++;
            }
            accUpdLst.add(acc);
        }
        if(accUpdLst.size()>0){
            update accUpdLst;
        }
*//*
    if(trigger.isinsert && trigger.isbefore){
        for(contact c: trigger.new){
            c.lastname='xyz';
        }
        }
    if(trigger.isupdate && trigger.isbefore){
        for(contact c: trigger.new){
            c.lastname='xyz1234';
        }
        }
    */
}