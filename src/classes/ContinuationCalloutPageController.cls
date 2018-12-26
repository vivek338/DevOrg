public with sharing class ContinuationCalloutPageController {
     private static String URL = 'http://durationservice.herokuapp.com/long?duration=';
     public String result {get;set;}
     public integer callbackCount {get;set;}
     public ContinuationCalloutPageController() {
         this.callbackCount = 0;
     }    
     // Duration value
     Integer defaultDuration = 1000;
     public Integer duration = 0;
     public Integer getduration () {
         return duration;
     }
     public void setduration (Integer value) {
         duration = value;
     }
     // Continuation request label
     public String requestLabel;
     
     public Object submit() {
         if ( duration <= 0 ) {
             duration = defaultDuration;
         }
         HttpRequest request = new HttpRequest();
         request.setEndpoint(URL + duration);
         request.setMethod('GET');
         request.setTimeout(60000);
         
         Continuation cont = new Continuation(60);
         // The requestLabel is the key to getting the Response object later, hang on to it!
         this.requestLabel = cont.addHttpRequest(request);
         cont.continuationMethod = 'processContinuationResponse';
         
        // Can add more HttpRequest objects here - up to three, they will all execute in parallel.
         return cont;
     }
     public Object processContinuationResponse() {
         System.debug('Callback called');
         HttpResponse response = Continuation.getResponse(this.requestLabel);
         System.debug('Got response: ' + response.getBody());
         Integer statusCode = response.getStatusCode();
         System.debug('ResponseCode: ' + statusCode);
         if ( statusCode != 200 ) {
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL, response.getBody()));
         } else {
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM, response.getBody()));
         }
         return null;
     }
  }