({
	add : function(component) {
        var sum = component.get("v.num1") + component.get("v.num2");
        component.set("v.sum",sum);  
        component.set("v.num2", sum);
        component.set("v.values1", 'hi'+sum);
	}
})