public class ProjectLink2{   
    public List<Account> accsandtmember{get;set;}    
    public ProjectLink2(){        
        accsandtmember = [Select Id, Name, BillingCountry,Industry from Account  ];
    }
}