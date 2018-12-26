public class TestcompApexController {

    @AuraEnabled
    public static List<String> strLst(){
        List<String> strLstToReturn = new List<String>{'abc','def','ghi'};
        return strLstToReturn;
    }
}