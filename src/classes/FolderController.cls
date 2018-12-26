global with sharing class FolderController {
    
    public static id userId { get; set; }
    
    static {
        userId = UserInfo.getUserId();
    }
    @AuraEnabled
    public static vivek338__Folder__c saveFolder(vivek338__Folder__c folder) {
    
    insert folder;
    return folder;
    }
@auraEnabled
    public static List<vivek338__User_Folder__c> getAllUserFolders()
    {
        system.debug('userid='+userId);
     List<vivek338__User_Folder__c> reg=new LIST<vivek338__User_Folder__c>();  
        reg=[select Id,name,vivek338__Folder__c, vivek338__Folder__r.name from vivek338__User_Folder__c where vivek338__User__c =: userId Order by Name];
        
        return reg;
    } 
@auraEnabled    
    public static List<String> selectedUserFolder(String recordId)
    {    
        system.debug('in method');        
      List<ContentDocumentLink>  cdlLst =[select Id, ContentDocumentId, ContentDocument.Title, LinkedEntityId FROM 
                                          									ContentDocumentLink WHERE LinkedEntityId =:recordId];
       List<String> strLst = new List<String>();
        for(ContentDocumentLink cdl: cdlLst){
            strLst.add(cdl.ContentDocument.Title);
        }
        system.debug('strLst='+strLst);
        return strLst;
    }
@auraEnabled    
    public static List<String> allDocumentsInLibrary()
    {    
        system.debug('in method');
      List<ContentDocument>  cdLst =[select Id, Title FROM ContentDocument];
       List<String> strLst = new List<String>();
        for(ContentDocument cd: cdLst){
            strLst.add(cd.Title);
        }
        return strLst;
    } 
@auraEnabled    
    public static List<String> matchedDocumentsInLibrary(string str)
    {    
      
        string toSearch = '%'+str+'%';
        List<ContentDocument> cdlLst = [select Id, Title FROM ContentDocument WHERE Title LIKE :toSearch];
        system.debug('cdllst='+cdlLst);
       List<String> strLst = new List<String>();
        for(ContentDocument cd: cdlLst){
            strLst.add(cd.Title);
        }
        return strLst;
    }     
}