trigger bustrigger on Bus__c(after insert) {
    for(Bus__c bus : trigger.new){
        if(bus.Type__c== 'AC Sleeper'){
            // create the new approval request to submit
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('Submitted for approval. Please approve.');
            req.setObjectId(bus.Id);
            // submit the approval request for processing
            Approval.ProcessResult result = Approval.process(req);
            // display if the reqeust was successful
            System.debug('Submitted for approval successfully: '+result.isSuccess());
        }
    }
}