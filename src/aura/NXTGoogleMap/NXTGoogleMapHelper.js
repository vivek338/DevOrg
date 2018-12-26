({
    
    getGenericRecs: function(component, helper){
        
        var action = component.get('c.getGenericObjRecs');
        action.setParams({ recId : component.get("v.recordId") });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            
            console.log('state:', state);
            if (state == "SUCCESS") {
                console.log('success transaction');
                var ret = response.getReturnValue();
                
                if(ret.length > 0){
                    console.log('latitude='+ret[0].vivek338__Latitude__c);
                    component.set("v.latitude",ret[0].vivek338__Latitude__c);
                    var lat = component.get("v.latitude");
                    var isDefined = !$A.util.isUndefined(component.get("v.latitude"));
                    console.log('isDefined-->'+isDefined); 
                    
                    
                    var mapOptionsCenter = {"lat":parseFloat(ret[0].vivek338__Latitude__c), "lng":parseFloat(ret[0].vivek338__Longitude__c)};
                    var mapData = Array();
                    
                    for(var i=0; i<ret.length; i++){
                        mapData.push({"lat":parseFloat(ret[i].vivek338__Latitude__c), "lng":parseFloat(ret[i].vivek338__Longitude__c), "markerText":ret[i].Name})
                    }
                    
                    component.set('v.mapOptionsCenter', mapOptionsCenter);
                    component.set('v.mapData', mapData);
                    
                    if(isDefined){
                        component.set('v.genRecs', ret);
                         console.log('it has value--'+component.get('v.genRecs'));
                    }else{
                        console.log('it is undefined--'+component.get('v.genRecs'));
                    }
                    
                }
                
            }
        });
        $A.enqueueAction(action);
    },
    
    
})