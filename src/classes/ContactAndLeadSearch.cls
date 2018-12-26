public class ContactAndLeadSearch {
    
    public static List<List<sObject>> searchContactsAndLeads(string name){
        List<List<sObject>> searchLst = [FIND :name in ALL FIELDS RETURNING  Contact(FirstName, LastName), Lead(FirstName, LastName)];
        return searchLst;
    }

}