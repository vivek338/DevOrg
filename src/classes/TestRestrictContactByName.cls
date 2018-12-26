@isTest
private class TestRestrictContactByName {
    
    static testMethod void consearchMethod1(){
        Contact con1 = new Contact();
        con1.LastName = 'Vivek';
        insert con1;
        con1.LastName = 'INVALIDNAME';
        try

            {

                update con1;

            }

            catch(Exception ee)

            {

            }
        
    }
    
    static testMethod void consearchMethod3(){
        List<Contact> conLst = new List<Contact>();
        for(integer i=0;i<199;i++){
        Contact con = new Contact();
        con.LastName = 'Con';
        conLst.add(con);   
            
        }
        if(conLst!=null && conLst.size()>0){
            Test.startTest();
            insert conLst;
            Test.stopTest();
        }
        
        
    }

}