public class actionfun {

    public PageReference call() {
        system.debug('inside the call method from controller');
        return null;
    }
    
    public PageReference callagainofcont() {
        system.debug('inside the call method from controller - again call');
          ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM, 'Success!'));
  
        return null;
    }

}