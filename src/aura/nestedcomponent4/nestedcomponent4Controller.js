({
	getOpps : function(cmp) {
        debugger;
		var action=cmp.get("c.getOpportunities");
        debugger;
        
        action.setCallback(this,function(response){
            debugger;
            var state=response.getState();
            if(state==="SUCCESS"){
                debugger;
                console.log('response.getReturnValue()'+response.getReturnValue());
                cmp.set("v.opportunities", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})