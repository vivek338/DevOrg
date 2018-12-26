public class ApexParamDemoController{
    //Property to hold the Id of the Record to be Deleted
    public Id RecordToDelete {get; set;}
    
    //Query all the Leads from the Database
    public List<Lead> AllLeads{
        get{ return [SELECT Id, Name FROM Lead]; }
    }
    
    //Delete the Record from the Database
    public void deleteRecord(){
        DELETE new Lead(Id = RecordToDelete);
    }
}