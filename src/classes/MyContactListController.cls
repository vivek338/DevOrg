public class MyContactListController {

    @AuraEnabled
    public static List<Contact> getContacts(Id recordId){
        return [Select id, FirstName, LastName, Email, Phone
               From Contact 
               Where AccountId=:recordId];
    }
}