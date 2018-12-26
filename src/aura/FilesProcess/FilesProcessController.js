({
	myAction : function(component, event, helper) {
		
	}, 
   
    onChildAttributeChange : function (component, event, helper) {
        console.log("Old value: " + event.getParam("oldValue"));
        console.log("Current value: " + event.getParam("value"));
        var action = component.get("c.getSelectedUserFolder");
        action.setParams({
        recordId : component.get("v.childAttribute")
    	});
        action.setCallback(this, function(response){
            var name = response.getState();
            if (name === "SUCCESS") {
                component.set("v.doc", response.getReturnValue());
            }
        });
     $A.enqueueAction(action);
    }
})