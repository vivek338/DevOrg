({
	getInput : function(cmp, event) {
        
		var fullname = cmp.find("name").get("v.value");
        var outputname = cmp.find("nameoutput");
        outputname.set("v.value", fullname+'**');
        
	}
})