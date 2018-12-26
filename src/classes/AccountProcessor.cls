public class AccountProcessor {
    
    @future
    public static void countContacts(Set<Id> accountId) {
        List<Account> accToUpd = new List<Account>();
        List<Account> accLst = [SELECT id, Number_of_Contacts__c, (select id from contacts) FROM Account where id=:accountId ];
        for(Account acc : accLst){
            List<Contact> conLst = acc.contacts;
            if( conLst.size()>0){
            	acc.Number_of_Contacts__c = conLst.size();
                accToUpd.add(acc);
            }
    	}
        if(accToUpd.size()>0){
            update accToUpd;
        }
    }
}