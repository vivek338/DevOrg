({
	clickCreate : function(component, event, helper) {
        var validExpense = component.find('expenseform').reduce(function(validSofar,inputCmp){
            inputCmp.showHelpMessageIfInvalid();
            return validSofar && inputCmp.get('v.validity').valid;
        },true)
        
        if(validExpense){
            var newExpense = component.get("v.newExpense");
            console.log("create Expense"+JSON.stringify(newExpense));
            helper.createExpense(component,newExpense);
        }
     }
})