({
	handleClick : function(cmp, event) {
		var attributevalue = cmp.get("v.text");
        console.log("current text"+attributevalue);
        var target;
        if(event.getSource){
            target = event.getSource();
            cmp.set("v.text", target.get("v.label"));
            
        }
        else
        {
         	target=event.target.value;
            cmp.set("v.text", event.target.value);
        }
	}
})