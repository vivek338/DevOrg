public class testpdfcontroller {

    public LIst<Account> accLst { get; set; }
    
    public testpdfcontroller(){
        accLst =[select id, name from account limit 10];
    }
    
}