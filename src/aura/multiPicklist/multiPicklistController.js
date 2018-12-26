({
    initialize: function(component, event, helper) {
       // call the fetchPickListVal helper function,
       // and pass (component, Field_API_Name, target_Attribute_Name_For_Store_Value)   
        helper.fetchPickListVal(component, event, 'listFilesOptions');
    },
    handleChange: function (component, event) {
       // get the updated/changed values   
        var selectedOptionsList = event.getParam("value");
        console.log('selectedOptionsList='+selectedOptionsList);
       // get the updated/changed source  
       
        var targetName = event.getSource().get("v.name");
         console.log('targetName='+targetName);
       
        // update the selected itmes  
        if(targetName == 'Files'){ 
            component.set("v.selectedFilesItems" , selectedOptionsList);
        }
        
    },
    getSelectedItems : function(component,event,helper){
       
        alert(component.get("v.selectedFilesItems"));
    }
})