public class StandardListControllerExt {
    public StandardListControllerExt(ApexPages.standardSetController con) {
        orgsettings__c orgSet = orgsettings__c.getInstance();
        con.setPageSize(Integer.valueOf(orgSet.CasePaginationSize__c));
    }
}