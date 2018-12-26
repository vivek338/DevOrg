public class HelloWorld {
    public string firstName = 'Vivek';
    public string lastName = 'Shatamraj';
    public Date myDate = Date.newInstance(2015, 7, 3);
    public Datetime myDateTime = Datetime.newInstance(2016,7,3, 0,15,0);
    public helloWorld(){
        system.debug('firstName:'+firstName);
        system.debug('lastName:'+lastName);
         system.debug('myDate:'+myDate);
         system.debug('myDateTime:'+myDateTime);
    }
}