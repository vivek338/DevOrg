public class nestedqueryexample
{
    public static  List<Contact> conLst{get; set;}
    public static string acontid{get; set;}
    public string ac;
    public void acccon() {
       // this.ac=acc;
        system.debug('inside acccon method');
      String interviewdate=Apexpages.currentPage().getParameters().get('accountsid'); 
        system.debug('interviewdate'+interviewdate);
        system.debug('acontid:'+acontid);
      //  system.debug('acc::'+acc);
        system.debug('ac:'+ac);
        conLst= [select id, name from contact where accountid =: acontid];
      //  return null;
    }

  public List<Account> getaccsandtmember()
  {
      List<Account> accounts = [select id, name, billingcountry, Type, (select id, name, Mailingcountry from contacts) from account where type!=null order by name];
      return accounts;
  }
}