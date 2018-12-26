trigger testtrigger on CampaignMember (before insert, before update,after insert, after update) {
    system.debug('trigger.new'+trigger.new);
    if(trigger.isBefore && trigger.isInsert){
    Set<String> AccountNamesSet = new Set<String>();
    Set<Id> externalIdSet = new Set<Id>();
    Set<String> typetset = new Set<String>();
        for(CampaignMember cmp: trigger.new){
            if(string.isNotBlank(cmp.vivek338__Account_Name_From_DL__c)){              
                AccountNamesSet.add(cmp.vivek338__Account_Name_From_DL__c);
            }
            if(cmp.vivek338__campaginExternalIdFromDL__c!=null){
                externalIdSet.add(cmp.vivek338__campaginExternalIdFromDL__c);
                typetset.add(cmp.vivek338__typeFromDL__c);
            }
        }
        List<Contact> contactLst = [Select id,name from Contact Where Account.name=:AccountNamesSet];
        Map<String,Id> contactMap = new Map<String,Id>();
        List<Campaign> campaignLst = [Select id From Campaign Where vivek338__zipari_ahc_Campaign_External_Id__c=:externalIdSet and type in:typetset];
        Map<String,List<Campaign>> CampaignMap = new Map<String,List<Campaign>>();
        for(Campaign camp: campaignLst){
            if(CampaignMap.containsKey(camp.vivek338__zipari_ahc_Campaign_External_Id__c)){
                List<Campaign> tempCampLst = campaignMap.get(camp.vivek338__zipari_ahc_Campaign_External_Id__c);
                tempCampLst.add(camp);
                CampaignMap.put(camp.vivek338__zipari_ahc_Campaign_External_Id__c, tempCampLst);
            }else{
                List<Campaign> initalCampaignLst = new List<Campaign>();
                initalCampaignLst.add(camp);
                CampaignMap.put(camp.vivek338__zipari_ahc_Campaign_External_Id__c, initalCampaignLst);
            }
        }
        for(Contact con: contactLst){
            if(string.isNotBlank(con.Account.name)){
                ContactMap.put(con.Account.name,con.id);
            }           
        }
        List<CampaignMember> campMemberToInsert = new List<CampaignMember>();
        for(CampaignMember cmp: trigger.new){
            if(string.isNotBlank(cmp.vivek338__Account_Name_From_DL__c)){                
                if(contactMap.containsKey(cmp.vivek338__Account_Name_From_DL__c)){
                    cmp.contactid=contactMap.get(cmp.vivek338__Account_Name_From_DL__c);
                    cmp.vivek338__From_DL__c=true;
                    if(campaignMap.containsKey(cmp.vivek338__campaginExternalIdFromDL__c))   {
                        for(Campaign cam: campaignMap.get(cmp.vivek338__campaginExternalIdFromDL__c)){
                            if(cmp.vivek338__typeFromDL__c==cam.type){
                                cmp.campaignId= cam.id;
                            }
                            
                        }
                    }
                    
                }
            }
        }
    
    }
}