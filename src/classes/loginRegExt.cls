public class loginRegExt{
    Registration__c reg;
    public String confirmpassword {get;set;}
    public loginRegExt(ApexPages.standardController stdCntrl){
     reg = new Registration__c();
     reg = (Registration__c)stdCntrl.getRecord();
    }
    public PageReference save() {
        //PageReference pr = new PageReference('/apex/LoginSucess');
        PageReference pr;//default value is: null
        if(String.isBlank(reg.Password123__c)) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,system.label.Reqpwd));
        }
        else {
            if(String.isBlank(confirmpassword)) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,system.label.ReqConfPwd));
            }
            else {
                if(reg.Password123__c != confirmpassword) {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,system.label.pwdConfpwdMisMatch));
                }
                else {
                    try {
                        insert reg;
                         pr = Page.LoginSucess1;
                    }
                    Catch(Exception e) {
                        String errMsg = e.getMessage();
                        if(errMsg.contains('duplicate value found: Email__c')) {
                            errMsg = system.label.EmailExists;
                        }
                        ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,errMsg));
                    }
                }
            }
        }       
        return pr;
    }
    
    public pageReference Cancel(){
    pageReference pr=Page.LoginRegistration;
   // pr.setRedirect(true);
    return pr;
    }
}