global class scheduletestbatch implements Schedulable{
    global void execute(SchedulableContext sc) {
    Batch_To_Update_Opportunity_To_offfices obj = new Batch_To_Update_Opportunity_To_offfices (); 
      Database.executeBatch(obj);
   }

}