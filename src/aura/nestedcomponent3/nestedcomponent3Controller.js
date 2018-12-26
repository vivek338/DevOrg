({
	echo : function(cmp) {
		var action=cmp.get("c.serverEcho");	
        action.setParams({firstname: cmp.get("v.firstname")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                alert("From server:"+response.getReturnValue());
            }
            else if(state==="INCOMPLETE"){
                
            }
                else if(state==="ERROR"){
                    var errors=response.getError();
                    if(errors){
                        console.log("error"+errors);
                    }
                }
        });
        $A.enqueueAction(action);
    }
})