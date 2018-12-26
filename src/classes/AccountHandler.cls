public class AccountHandler {
    
    public static Account insertNewAccount(String str){
        
            if(str!=null){
                try{   
             Account acct = new Account(NAME = str);
                insert acct;
                ID acctId = acct.id;
                return acct;
            }  
            catch(Exception e){
            system.debug(e.getMessage());
            return null;
        	}
            }
            else{
                return null;
            }
        
        
            
        
        
    }

}