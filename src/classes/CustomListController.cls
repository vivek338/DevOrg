public class CustomListController{
    public ApexPages.StandardSetController con{ 
        get
        {
            if(con==null){
                con = new Apexpages.StandardSetController(
                [select casenumber, status, AccountId, ContactId from Case Limit: Limits.getLimitQueryRows()]
            );
            orgsettings__c orgSet = orgsettings__c.getInstance();
            con.setPageSize(Integer.valueOf(orgSet.CasePaginationSize__c));
            }
        return con;
        }
        set;
        }
    public List<case> getCases() {
        return (List<case>)con.getRecords();
    }
}