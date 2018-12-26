public class ContactSearch {
    
    public static List<Contact> searchForContacts(String name, String code){
        List<contact> conLst = [select id, name from contact where LastName =: name AND MailingPostalCode =: code];
        return conLst;
    }

}