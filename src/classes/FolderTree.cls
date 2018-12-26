public with sharing class FolderTree {
   
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
}