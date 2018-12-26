@isTest
private class LeadProcessorTest {

    @isTest static void LeadProcessorTestMethod(){
        
        List<Lead> ldLst = new List<Lead>();
        for(integer i=0; i<200; i++){
            Lead ld = new Lead();
            ld.LastName='lead'+i;
            ld.Company='test company';
            ld.LeadSource='Web';
            ldLst.add(ld);
        }
        if(!ldLst.isEmpty())
            insert ldLst;
        system.debug('ldLst'+ldLst);
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        system.debug('ldLstupd'+[select id, LastName, LeadSource from Lead]);
        
    }
}