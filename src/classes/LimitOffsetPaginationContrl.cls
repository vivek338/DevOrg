public class LimitOffsetPaginationContrl {
    public Integer totCount {get;set;} 
    public Integer offsetSize {get;set;} 
    public Integer limitSize {get;set;}
    public LimitOffsetPaginationContrl() {
        totCount = [select count() from Case Limit: Limits.getLimitQueryRows()];
        orgsettings__c orgSet = orgsettings__c.getInstance(UserInfo.getUserId());
        limitSize = Integer.valueOf(orgSet.CasePaginationSize__c);
        offsetSize = 0;
    }    
    public List<Case> getCases() {
        return [select casenumber, status, AccountId, ContactId from Case 
        Limit: limitSize offset: offsetSize ];
    }
    
    public void first() {
        offsetSize = 0;
    }
    public void previous() {
        offsetSize = offsetSize - limitSize;
    }
    public void next() {
        offsetSize = offsetSize + limitSize;
    }
    public void last() {
        Integer reminder = Math.mod(totCount, limitSize);
        if(reminder == 0)
            offsetSize = totCount - limitSize;
        else
            offsetSize = totCount - reminder;
    }
    public Boolean getHasPrevious() {
        if(offsetSize == 0)
            return false;
        else 
            return true;
    }
    public Boolean getHasNext() {
        if(offsetSize + limitSize >= totCount)
            return false;
        else
            return true;
    }
}