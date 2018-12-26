public class AccountProcessorsec 
{
  //@future    // future annotation 
  public static void CheckMethod(){
     Boolean b=System.isFuture();    // fuction 'isfuture()' to the '@future' annotation 
     System.debug('>>>>>isFuture value is ='+b);     
     // b='TRUE' and if you removed the '@future' from the code it returns b='FALSE'
   }
 }