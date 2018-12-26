public class loginHomeContrl {
    public string username {set;get;}
    public string password {set;get;}
    
    public PageReference validateLogin() {
        PageReference pr;//default value: null
        if(String.isBlank(username)) {
            ApexPages.addMessage(new ApexPages.Message(Apexpages.severity.Error,'Please enter username.'));
        }
        else {
            if(String.isBlank(password)) {
                ApexPages.addMessage(new ApexPages.Message(Apexpages.severity.Error,'Please enter password.'));
            }
            else {
                List<Registration__c> regLst = [select email__c, password123__c from Registration__c 
                where email__c =: username];
                if(regLst == null || regLst.size() == 0) {
                    ApexPages.addMessage(new ApexPages.Message(Apexpages.severity.Error,'Username doesn\'t exists.'));
                }
                else {
                    if(regLst[0].Password123__c != password) {
                        ApexPages.addMessage(new ApexPages.Message(Apexpages.severity.Error,'Password is wrong.'));
                    }
                    else {
                        pr = Page.Welcome;
                    }
                }
            }
        }
        return pr;
    }
}