({
	createExpense : function(component,expense) {
		var expenses = component.get("v.expenses");
        console.log("Expneses Before Create:"+JSON.stringify(expenses));
        expenses.push(JSON.parse(JSON.stringify(expense)));
        component.set("v.expenses",expenses);
        console.log("Expneses After Create:"+JSON.stringify(expenses));
       
	}
})