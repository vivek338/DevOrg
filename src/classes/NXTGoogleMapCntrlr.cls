public with sharing class NXTGoogleMapCntrlr {
    @AuraEnabled
    public static List<Account> getGenericObjRecs(Id recId){
        if(recId != null){
            Id recIdval = recId;
            String sObjName = recIdval.getSObjectType().getDescribe().getName();
            String query = 'Select id, name,vivek338__Latitude__c,vivek338__Longitude__c from '+sObjName + ' where id = '+'\''+recIdval+'\'';
          //  List<sObject> objectRecList = Database.query(query);
            List<Account> objectRecList = [Select id, name,vivek338__Latitude__c,vivek338__Longitude__c from Account where id =:recId];
            system.debug('lat='+objectRecList[0].vivek338__Latitude__c);
             system.debug('longitude='+objectRecList[0].vivek338__Longitude__c);
            return objectRecList;
        }else{
            
            return null;
        }
        
    }
}