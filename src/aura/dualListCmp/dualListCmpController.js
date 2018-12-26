/** Client-Side Controller **/
({
    initialize: function (component, event, helper) {
        var options = [
            { value: "1", label: "Option 1" },
            { value: "2", label: "Option 2" },
            { value: "3", label: "Option 3" },
            { value: "4", label: "Option 4" },
            { value: "5", label: "Option 5" },
            { value: "6", label: "Option 6" },
            { value: "7", label: "Option 7" },
            { value: "8", label: "Option 8" },
        ];
        var values = ["7", "2", "3"];
        var required = ["2", "7"];
        component.set("v.listOptions", options);
        component.set("v.defaultOptions", values);
        component.set("v.requiredOptions", required);
    },
    handleChange: function (cmp, event) {
        // Get the list of the "value" attribute on all the selected options
        var selectedOptionsList = event.getParam("value");
        alert("Options selected: '" + selectedOptionsList + "'");
    },
   
    onChange: function (cmp, event) {
    // Retrieve an array of the selected options
    var selectedOptionValue = event.getParam("value");
    },
    search: function(component, event, helper) {
        // Filter list
       console.log('event search val='+component.get("v.term"));
         var newoptions = [
            { value: "1", label: "Option 11" },
            { value: "2", label: "Option 22" },
            { value: "3", label: "Option 33" },
            { value: "4", label: "Option 44" },
            { value: "5", label: "Option 55" }
        ];
             var newdefalutoptions = component.get("v.defaultOptions");
         console.log('default values ='+component.get("v.defaultOptions"));       
          component.set("v.listOptions", newoptions);
          //   var newval = ["44", "66"];
           console.log('default values ='+component.get("v.defaultOptions")); 
              component.set("v.defaultOptions", newdefalutoptions);
         console.log('default values ='+component.get("v.defaultOptions"));
    }

})