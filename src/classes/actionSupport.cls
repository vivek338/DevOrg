public class actionSupport {
    
    public integer count{get; set;}
    
    public actionSupport(){
        system.debug('inside constructor');
        this.count=0;
    }
    
    public pageReference increment(){
        system.debug('inside increment method');
        count++;
        return null;
    }
    
    
    

}