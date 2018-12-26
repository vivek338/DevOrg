@isTest
private class AccountProcessorTest {
    
    @isTest static void TestAccountProcessorTest(){
        
        List<Account> accLst = new List<Account>();
        List<Contact> conLst = new List<Contact>();
        for(integer i=0; i<3; i++){
            Account acc = new Account();
            acc.Name ='account 1-'+i;
            accLst.add(acc);
        }
        if(accLst.size()>0)
        	insert accLst;
        
        for(Account acc: accLst){
            for(integer j=0; j<5; j++){
                Contact con = new Contact();         
                con.LastName ='user 1-'+j;
                con.AccountId = acc.id;
                conLst.add(con);
         }
        }
         if(conLst.size()>0)
        	insert conLst;
            set<id> accIds = new set<id>();
        for(Account act: accLst){    
        	accIds.add(act.id);
        }
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
    }

}