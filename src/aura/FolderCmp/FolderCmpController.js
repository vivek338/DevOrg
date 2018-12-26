({
   doInit : function(component, event, helper) {
        var action = component.get("c.getAllUserFolders");
        action.setCallback(this, function(response){
            var name = response.getState();
            if (name === "SUCCESS") {
                component.set("v.reg", response.getReturnValue());
            }
        });
     $A.enqueueAction(action);
    },
    onSelectChange : function(component, event, helper) {
    var selected = component.find("levels").get("v.value");
    //do something else
	},
    searchTextVal : function(component, event, helper) {
        var searchText = component.get('v.searchText');
        console.log('value='+searchText);
        var action = component.get("c.matchedDocumentsInLibrary");
        var opts = [];
        action.setParams({
            str : searchText
        });
        action.setCallback(this, function(response){
           if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
 
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.find("accIndustry1").set("v.options", opts);
            }
        });
     $A.enqueueAction(action);
    },
    
  onSelectChange : function(component, event, helper) {
    var selected = component.find("accIndustry1").get("v.value");
      console.log(selected);
    
       component.set("v.selected", selected);
    //do something else
 },
  
    handleClick : function(cmp, event) {
        
        var target = event.getSource();
        console.log("Current VAlue="+ target.get("v.value"));       
      
        var action = cmp.get("c.selectedUserFolder");
        action.setParams({
        recordId : target.get("v.value")
    	});
        action.setCallback(this, function(response){
            var name = response.getState();
            if (name === "SUCCESS") {
                cmp.set("v.doc", response.getReturnValue());
                var opts = response.getReturnValue();
                cmp.find("InputSelectMultiple").set("v.options", opts);
            }
        });
     $A.enqueueAction(action);    
    },
    fetchPickListVal: function(component, event, helper) {
        var target = event.getSource();
        var action = component.get("c.selectedUserFolder");
        action.setParams({
            recordId : target.get("v.value")
        });
        var opts = [];
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
 
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.find("accIndustry").set("v.options", opts);
            }
        });
       
        var action1 = component.get("c.allDocumentsInLibrary");        
        var opts1 = [];
        action1.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues1 = response.getReturnValue();
 
                if (allValues1 != undefined && allValues1.length > 0) {
                    opts1.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues1.length; i++) {
                    opts1.push({
                        class: "optionClass",
                        label: allValues1[i],
                        value: allValues1[i]
                    });
                }
                console.log('about to push to list');
                console.log('about to push to list='+opts1);
                component.find("accIndustry1").set("v.options", opts1);
            }
        });
        console.log('about to first call');
        $A.enqueueAction(action);
         console.log('about to second call');
        $A.enqueueAction(action1);
    },
     onMultiSelectChange: function(cmp) {
         var selectCmp = cmp.find("InputSelectMultiple");
         var resultCmp = cmp.find("multiResult");
         resultCmp.set("v.value", selectCmp.get("v.value"));
	 },
    openModel: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      component.set("v.isOpen", true);
   },
 
   closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
   },
 
   likenClose: function(component, event, helper) {
      // Display alert message on the click on the "Like and Close" button from Model Footer 
      // and set set the "isOpen" attribute to "False for close the model Box.
      console.log('thanks for like Us :)'+component.get("v.newFolder"));
       var newFolder = component.get("v.newFolder");
    var action = component.get("c.saveFolder");
    action.setParams({ 
        "folder": newFolder
    });
    action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
                console.log('returned from method');
              
            }
        });
    $A.enqueueAction(action);
        var appEvent = $A.get("e.c:folderReferesh");
console.log('about to fire event');     
        appEvent.fire();
      component.set("v.isOpen", false);
       
   }
})