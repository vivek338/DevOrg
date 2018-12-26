public with sharing class OpportunitiesController1 {
 @AuraEnabled
   public static list<opportunity> getProductByName() {
        list<opportunity> options= [select id, name from opportunity ];
        return options;
    }
}