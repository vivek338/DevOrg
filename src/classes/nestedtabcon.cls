public class nestedtabcon {

    public List<Account> getAccounts() {
        List<Account> accLst = [select id, name, industry, (select id,name, lastname from contacts) from account];
        
        return accLst;
    }

}