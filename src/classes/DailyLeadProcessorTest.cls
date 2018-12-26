@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    
    @isTest static void methodtest(){
        
       List<Lead> ldLst = new List<Lead>();
        for(integer i=0; i<200; i++){
            Lead ld = new Lead(lastname='lead'+i, company='abc');
            ldLst.add(ld);
        }
        system.debug('ldLst:'+ldLst);
        if(!ldLst.isEmpty())
        insert ldLst;
        
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP,new DailyLeadProcessor());        
        Test.stopTest();
    }

}