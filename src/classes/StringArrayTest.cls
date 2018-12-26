public class StringArrayTest {
    
    public static List<String> generateStringArray(integer n){
        List<String> strLst = new List<String>();
        system.debug('inside method');
        for(integer i=0;i<n;i++){
            system.debug('inside for loop');
            strLst.add('Test '+i);            
        }
        return strLst;
    }

}