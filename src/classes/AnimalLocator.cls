public class AnimalLocator
{
//public OurtreachMemvbersjson.OurtreachMemvbersjson_inner  All_claims {get;set;}
  public static String getAnimalNameById(Integer id)
   {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
          String strResp = '';
           system.debug('******response '+response.getStatusCode());
           system.debug('******response '+response.getBody());
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) 
        {
            
			OurtreachMemvbersjson.OurtreachMemvbersjson_inner All_claims  = new OurtreachMemvbersjson.OurtreachMemvbersjson_inner();
            All_claims  = OurtreachMemvbersjson.parse(response.getBody());
            system.debug('all_clims='+all_claims);
            system.debug('&='+All_claims.ProcessingStatusList);
            system.debug('&='+All_claims.OutreachMembers.OutreachMembers.Member[0].FinalOutcome);
            List<OurtreachMemvbersjson.Member> objlst = All_claims.OutreachMembers.OutreachMembers.Member;
            Map<String,String> MemberAndCampaignNameMap= new Map<String,string>();
            for(OurtreachMemvbersjson.Member sob: objlst){
                if(sob.FinalOutcome=='Successfull'){
                system.debug(sob.MemberID);
                MemberAndCampaignNameMap.put(sob.MemberID,sob.CampaignName);
                }
            }
            Map<String,String> MemberAndContactIdMap= new Map<String,string>();
            List<Contact> conLst = [Select Id,Account.name From Contact Where Account.name in:MemberAndCampaignNameMap.keySet()];
            for(Contact con: conLst){
                MemberAndContactIdMap.put(con.Account.name,con.Id);
            }
            Map<String,String> CampaignNameAndCampaignIdMap= new Map<String,string>();
            List<Campaign> campaignLst = [Select id,name from Campaign where name in:MemberAndCampaignNameMap.values()];
            for(Campaign cmp: campaignLst){
                CampaignNameAndCampaignIdMap.put(cmp.name,cmp.id);
            }
            List<CampaignMember> cmpMembToInsLst = new List<CampaignMember>();
            for(OurtreachMemvbersjson.Member sob1: objlst){
                if(sob1.FinalOutcome=='Successfull'){
                CampaignMember cmpMem = new CampaignMember();
                    cmpMem.CampaignId=CampaignNameAndCampaignIdMap.get(sob1.CampaignName);
                    cmpMem.ContactId=MemberAndContactIdMap.get(sob1.MemberID);
                    cmpMembToInsLst.add(cmpMem);
                }
            }
            if(cmpMembToInsLst.size()>0){
                insert cmpMembToInsLst;
            }
            // Deserializes the JSON string into collections of primitive data types.
  //         Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
    //       Map<string,object> animals = (map<string,object>) results.get('ProcessingStatusList');
      //      System.debug('Received the following animals:' + animals );
          //  strResp = string.valueof(animals.get('name'));
           // System.debug('strResp >>>>>>' + strResp );
        }
        return strResp ;
   }
  
}