public class trigger_class{
    public static void trigger_method(List<Opportunity> ops){
        Double Total_Amount =0;
        for(Opportunity o1: [select Amount from Opportunity where CreatedDate = TODAY
                                            AND CreatedByID = : UserInfo.getUserID()]){
            Total_Amount+=o1.Amount;                            
                                            
         }
         
         for(Opportunity o2: ops){
             if(trigger.isInsert && o2.Amount<10000){
                 o2.addError('Amount for Insert Can not be less than 10000');
             }
             else if(trigger.isUpdate && o2.Amount<20000){
                 o2.addError('Amount for Update Can not be less than 20000');
             }
         }
         for(Opportunity o3: ops){
             Total_Amount+=o3.Amount;
             if(Total_Amount>100000){
                 o3.addError('You have Exceeded your Daily Limit total opportunity amount 100000');
             }
         }
                                            
    }
}