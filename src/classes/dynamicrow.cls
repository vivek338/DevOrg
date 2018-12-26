public class dynamicrow 
{
    public List<vivek338__Bus__c> memberList {get;set;}
    public List<vivek338__Bus__c> memberAddList {get;set;}
    public String memberName {get;set;}   
     
    public dynamicrow()
    {
        String sql = 'SELECT Name, vivek338__Type__c FROM vivek338__Bus__c';
        memberList = Database.Query(sql);
        memberAddList = new List<vivek338__Bus__c>();
        memberAddList.add(new vivek338__Bus__c());
    }
    
    public void AddRow()
    {
        
        memberAddList.add(new vivek338__Bus__c());
    }  
}