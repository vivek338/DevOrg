public with sharing class FilesInFolderApexController {
   @AuraEnabled
    public static List<ContentDocumentWrapper> filesRetriveInFolder(String ParentObj)
    {
        List<ContentDocumentLink> sobjLstToReturn = new List<ContentDocumentLink>();
       sobjLstToReturn = [SELECT Id,ContentDocumentId,ContentDocument.Title,LinkedEntityId,ContentDocument.LastModifiedDate FROM ContentDocumentLink Where LinkedEntityId=:ParentObj order by ContentDocument.Title];
        system.debug('sobjLstToReturn='+sobjLstToReturn);
      //  return (List<sObject>)Database.query(query);
        List<ContentDocumentWrapper> contDocsLst = new List<ContentDocumentWrapper>();
        Set<Id> contdocIdsSet = new Set<Id>();
        for(ContentDocumentLink cdl: sobjLstToReturn){
            contdocIdsSet.add(cdl.ContentDocumentId);
            /*
            ContentDocumentWrapper cd = new ContentDocumentWrapper();
            cd.Title = cdl.ContentDocument.Title;
            cd.lastModifiedDate = cdl.ContentDocument.LastModifiedDate;
            cd.action = false;
            contDocsLst.add(cd); */
        }
        List<ContentDocument> conDocumentAllLst = [Select id, Title, LastModifiedDate from ContentDocument order by Title];
        for(ContentDocument con: conDocumentAllLst){
            if(contdocIdsSet.contains(con.id)){               
                contDocsLst.add(populateServiveObject(con, true));
            }
        }
        for(ContentDocument cond: conDocumentAllLst){
            if(!contdocIdsSet.contains(cond.id)){               
                contDocsLst.add(populateServiveObject(cond, false));
            }
        }                        
        return contDocsLst;
    }
   
    public static ContentDocumentWrapper  populateServiveObject(ContentDocument conDocu, boolean isInFolder){
      ContentDocumentWrapper condocRec = new ContentDocumentWrapper();
       condocRec.Title =  conDocu.Title;
       condocRec.lastModifiedDate =  conDocu.LastModifiedDate;
       condocRec.recordId =  conDocu.Id;
        if(isInFolder){
       		condocRec.action =  true;
        } else{
            condocRec.action =  false;
        }
      return  condocRec; 
    }                         
    
    @AuraEnabled
    public static List<sObject> parentRecords(String ParentObj, String ChildObj, String ParentObjNameField, String ChildObjNameField)
    {
        String query = 'SELECT ' + ParentObjNameField + ' FROM ' + ParentObj + ' Order by '+ ParentObjNameField;
        return (List<sObject>)Database.query(query);
    }
    @AuraEnabled
    public static vivek338__Folder__c updatefolder(string foldername, string folderid) {
         vivek338__Folder__c vfolder = new vivek338__Folder__c();
        try{
           vfolder.id=folderid;
            vfolder.name=foldername;
    update vfolder;
        } Catch(Exception e){
            system.debug('exceiption in foler ree='+e.getMessage());
        }
    return vfolder;
    }
    
     @AuraEnabled
    public static void deleteFolder(string folderid) {
         vivek338__Folder__c vfolder = new vivek338__Folder__c();
        try{
           vfolder.id=folderid;
    delete vfolder;
        } Catch(Exception e){
            system.debug('exceiption in foler ree='+e.getMessage());
        }
    }
    
    public class ContentDocuments{
        @AuraEnabled public ContentDocumentLink contDocLink {get;set;}
        @AuraEnabled public Boolean action {get;set;}
    }
     public class ContentDocumentWrapper{
        @AuraEnabled public String title {get;set;}
        @AuraEnabled public Boolean action {get;set;}
        @AuraEnabled public DateTime lastModifiedDate {get;set;} 
        @AuraEnabled public String recordId {get;set;} 
    }
}