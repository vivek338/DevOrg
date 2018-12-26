public with sharing class AccountContactsWizardExt{
    public String accId;
    public string subject{get;set;}
    public string emailbody{get;set;}
    List<ContactsWrapper> conWrapLst;
    public AccountContactsWizardExt(ApexPages.standardController controller){
        accId = ApexPages.CurrentPage().getParameters().get('id');
    }
    
    public List<ContactsWrapper> getContacts(){
        conWrapLst = new List<ContactsWrapper>();
        for(contact conRec: [select id, name, email, accountId, phone from contact where accountid =: accId]){
            ContactsWrapper conWrap = new ContactsWrapper();
            conWrap.con = conRec;
            conWrapLst.add(conWrap);
        }
        return conWrapLst;    
    }
    public class ContactsWrapper{
        public boolean isTrue {get;set;}
        public contact con {get;set;}
        public contactsWrapper(){
        isTrue = false;
        }
    }
    
    public void sendEmail(){
    List<String> emails = new List<String>();
    for(ContactsWrapper conWrap :conWrapLst){
        if(conWrap.isTrue){
            emails.add(conWrap.con.Email);    
        }          
    }
    
    if(emails.size() == 0)
        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,'Please select atleast one contact to send an email'));
    
    else{
        if(string.isBlank(subject)){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,'Please enter the subject to send an email'));
        }
        else{
            if(string.isBlank(emailbody)){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,'Please enter messege to send an email'));
            }
            else{
                Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
                mail.setToAddresses(emails);
                mail.setSubject(subject);
                mail.setplainTextbody(emailbody);
                Messaging.SendEmail(new List<Messaging.Singleemailmessage> {mail});
            }
        }
     }
  }
}