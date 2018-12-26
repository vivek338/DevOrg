({
	handleClick : function(component, event, helper) {
        
        var x=event.getSource();
        var y=x.get("v.label");
        console.log("handleClick: Message: " + y);

        component.set("v.message", y);
       // component.set("v.message", event.getSource().get("v.label"));
        
		
	}
})