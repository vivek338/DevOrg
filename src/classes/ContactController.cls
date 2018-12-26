public with sharing class ContactController {
    
    @AuraEnabled    
    public static List<Contact> findAll(){
        
        return [select id, name, phone from Contact LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name='%'+searchkey+'%';
        return [select id, name, phone, createddate from Contact where name LIKE:name LIMIT 50];
    }
    
    @AuraEnabled
    public static Contact findById(String contactId){
        
        return [select id, name, title, phone, mobilephone, Account.Name from contact where id=:contactId];
    }

}