global class LightningDistanceFinder {
    @RemoteAction
    global static DistanceInfo findDistance(String source, String destination) {
        String url = 'callout:DistanceMatrixApi?origins='+source+'&destinations='+destination+'&mode=car&language=eng';
        
        /*** Making REST API Call out ***/
        Http h = new Http();
         
        //Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        //Response
        HttpResponse res = h.send(req);//making callout.
        system.debug('res.getBody(): '+res.getBody());
        JSON2Apex jApex = JSON2Apex.parse(res.getBody());
        DistanceInfo dInfo = new DistanceInfo();
        dInfo.distance = String.valueOf(jApex.rows[0].elements[0].distance.text);
        dInfo.duration = String.valueOf(jApex.rows[0].elements[0].duration.text);
        return dInfo;
    }
    
    global class DistanceInfo {
        public String distance, duration;
    }
}