({
    doInit: function (cmp, event, helper) {
        console.log('in treecmp controller');
         console.log(cmp.get("v.isFolderSelected"));
        //var items = [];
        var parentObj = cmp.get('v.parentObj');       
        var parentObjNameField = cmp.get('v.parentObjNameField');
             
        var action = cmp.get('c.parentRecords');
        action.setParams({
            ParentObj : parentObj,          
            ParentObjNameField : parentObjNameField          
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log("state:" + state);
            if (state === "SUCCESS") {
                // replace parent object name with label
                var objects = JSON.stringify(response.getReturnValue()).replace(new RegExp(parentObjNameField, 'g'), 'label');
                                                
                //var accounts = JSON.stringify(response.getReturnValue()).replace(new RegExp('Name', 'g'), 'label').replace(new RegExp('Opportunities', 'g'), 'items');
                console.log('Before update:'+ objects);
                
                cmp.set("v.items", JSON.parse(objects) );
            }
            else{
                console.log("Failed with state: " + response.getError());
            }
        });
        $A.enqueueAction(action);   
    },
    showSpinner: function (cmp, event){
        cmp.set("v.spinner", true);
    },
    hideSpinner: function (cmp, event){
        cmp.set("v.spinner", false);
    },
    
    deletefolder: function(component, event, helper) {
       var retVal = confirm('are you sure want to delete teh record');
      // for Display Model,set the "isOpen" attribute to "true"
        if(retVal==true){
      console.log('event='+event.getSource().get("v.value"));
            console.log('folder to del='+component.get("v.newFolder").id);
     var action = component.get("c.deleteFolder");
    action.setParams({         
        "folderid": component.get("v.newFolder").id
    });
    action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
              console.log('record delted');
            } else{
                console.log('stsat='+state);
            }
        });
    $A.enqueueAction(action);
        var appEvent = $A.get("e.c:folderReferesh");
console.log('about to fire event');     
        appEvent.fire();    
        }
   },
    selctedFolder: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      console.log('selecte folder event='+event.getSource().get("v.value"));
        component.set("v.newFolder.id", event.getSource().get("v.value"));
         console.log(component.get("v.isFolderSelected"));
        component.set("v.isFolderSelected", true);
        console.log(component.get("v.isFolderSelected"));
         console.log('selecte folder retruned='+component.get("v.newFolder.id"));
        component.set("v.recordId", component.get("v.newFolder.id"));
        /*
        console.log('record id='+component.get("v.newFolder.id"));
        component.set("v.recordId", component.get("v.newFolder.id"));
        console.log('v.recordId='+component.get("v.recordId"));
      component.set("v.isOpen", true);*/  
         var appEvent = $A.get("e.c:FilesInFolderRefresh");
console.log('about to fire event');     
         appEvent.setParams({
            message : event.getSource().get("v.value")
         });
        appEvent.fire(); 
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
      console.log('thanks for like Us :)'+component.get("v.newFolder").Name);
       var newFolder = component.get("v.newFolder");       
    var action = component.get("c.updatefolder");
    action.setParams({ 
        "foldername": component.get("v.newFolder").Name,
        "folderid": component.get("v.newFolder").id
    });
    action.setCallback(this, function(a) {
           var state = a.getState();
            if (state === "SUCCESS") {
                var name = a.getReturnValue();
                console.log('returned from method');
              
            } else{
                console.log('stsat='+state);
            }
        });
    $A.enqueueAction(action);
        var appEvent = $A.get("e.c:folderReferesh");
console.log('about to fire event');     
        appEvent.fire();
      component.set("v.isOpen", false);
       
   }
})