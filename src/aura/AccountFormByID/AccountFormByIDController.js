({
    doInitAction : function(component, event, helper) {
              var action = component.get(“c.find_AccById”);
        action.setParams({ “get_accountid”: component.get(“v.accGetID”) });
         action.setCallback( this, function(response) {
            var state = response.getState();
            if (state === “SUCCESS”) {
                component.set(“v.ac”, response.getReturnValue());
                console.log(response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
})