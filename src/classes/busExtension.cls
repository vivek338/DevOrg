public class busExtension {
	public List<busattachment__c> buses{get;set;}
    public List<ContentDocumentLink> attachments{get;set;}
    //List<busattachment__c> busattLst;
    public busattachment__c bsatt;
    public busExtension(ApexPages.StandardController controller) {
        system.debug('inside controller');
        bsatt = [select id, bus__c from busattachment__c where id =:controller.getId()];
        system.debug('bsatt'+bsatt);
		set<id> setBuses = new set<Id>();        
        if(controller.getId() != null) {
            retrievebusesRecords(controller.getId());
          	for(busattachment__c bs:buses){
                setBuses.add(bs.id);
          	}             
            system.debug('ids:'+setBuses);
            /*setbusattLst = [select id from busattachment__c where bus__c =:setBuses];
            system.debug('finallsit'+setbusattLst); */
      		retrievebusesAttachments(setBuses);            
    	}
    }
    public PageReference updatebus() {
        system.debug('insideupdate'+bsatt.bus__c);
          bus__c bs = new bus__c(id=bsatt.bus__c);
        bs.Active__c=true;
        system.debug('bsactive'+bs.active__c);
        update bs;
          return null;
}
        public void retrievebusesRecords(Id OrgId){
            buses = [select Id from busattachment__c where id = :OrgId]; 
            system.debug('lsitids:'+buses);
    	}
        public void retrievebusesAttachments(set<id> setBuses){
        attachments = [SELECT ContentDocumentId, ContentDocument.title FROM ContentDocumentLink WHERE LinkedEntityId =: setBuses];
            system.debug('lstattach:'+attachments);
    	} 
}