public class hellopagecontroller {
public String inputstring;
public static list<Account> acclst{get;set;}

public Id selectedOffice{get; set;}

    public hellopagecontroller (){
    system.debug('inside controller');
        inputstring ='';
        acclst = new List<Account>(); 
        selectedOffice=null;
    }
    
    public string getinputstring(){
        return inputstring;
    }
    
    public void setinputstring (string s){
        system.debug('inside set inputstirng');
        system.debug('s='+s);
        inputstring =s;
        system.debug('inputstring ='+inputstring );
    }
    
    public PageReference go() {
    string str = inputstring;
    string query = 'select id,name from account where name like \'%'+str+'%\'';
    acclst = database.query(query);
    system.debug(acclst);
       
        return null;
    }
    
    Public pageReference selectcon()
    {
        system.debug('inside method selectcon');
        String selcontactid = System.currentPagereference().getParameters().get('id');
        system.debug('selcontactid ='+selcontactid );
        
        account accn = [Select Id,Name from account where Id=:selcontactid];
        //selectcon =  new List<account>();
       // selectcon.add(con);
       system.debug('accn  ='+accn );
       return null;
    }
    
    public pageReference redirectToRecordTypeSelection(){
    system.debug('inside redirect method');
    string acid='abcd';
     acid= ApexPages.currentPage().getParameters().get('selectedOffice');
     system.debug('acid'+acid);
    system.debug('selectedOffice='+selectedOffice);
    
    return null;
    
    }


    
}