public class DailyLeadProcessor implements Schedulable  {
    
    
   
    public static void execute(SchedulableContext sc){
        List<Lead> ldLst = [select id, leadsource from Lead where Leadsource=null limit 200];
    
    Set<Id> ldSet = new Set<Id>();
         List<Lead> ldToUpd = new List<Lead>();
        for(lead ld1: ldLst){
            ldSet.add(ld1.id);
        }
        system.debug('ldSet:'+ldSet);
    for(id ids: ldSet){
        lead ld = new lead(id=ids);
        ld.LeadSource='Dreamforce';
        ldToUpd.add(ld);
    }
        
    if(!ldToUpd.isEmpty())
        update ldToUpd;
    }

}