public class AccountTriggerHandler {
    public static void methodInvoke(){
        processPrimaryContactConnection();
        
    }
    
    @future
    private static void processPrimaryContactConnection(){
        system.debug('inside future method');
       
    }
}