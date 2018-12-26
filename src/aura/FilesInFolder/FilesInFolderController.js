({
	doInit : function(component, event, helper) {
		console.log("Record Selected Id: " + event.getParam("message"));
       

        var record = event.getParam("message");
        console.log('record='+record);
        var action = component.get('c.filesRetriveInFolder');
        action.setParams({
            ParentObj : record                    
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log("state:" + state);
            if (state === "SUCCESS") {
                // replace parent object name with label
            //    var objects = JSON.stringify(response.getReturnValue()).replace(new RegExp(parentObjNameField, 'g'), 'label');
                                                
                //var accounts = JSON.stringify(response.getReturnValue()).replace(new RegExp('Name', 'g'), 'label').replace(new RegExp('Opportunities', 'g'), 'items');
                console.log('Before update:'+component.get("v.items")); 
                component.set("v.items", response.getReturnValue());
                 component.set("v.displayFiles", true);
                console.log('records returned='+response.getReturnValue());
                console.log('Before update:'+component.get("v.items")); 
                setTimeout(function(){ 
                   
                    $('#tableId').DataTable();
                    // add lightning class to search filter field with some bottom margin..  
                    $('div.dataTables_filter input').addClass('slds-input');
                    $('div.dataTables_filter input').css("marginBottom", "10px");
                      component.find("master").set("v.value", false);
                    console.log('unchek master');
                }, 500);  
            }
            else{
                console.log("Failed with state: " + response.getError());
            }
        });
        $A.enqueueAction(action);
     //    component.find("master").set("v.value", false);
     //   component.set("v.folderRecordId", record);
     //   console.log('value in last comp='+component.get("v.folderRecordId"));
	},
     scriptsLoaded : function(component, event, helper) {
        console.log('Script loaded..'); 
    },
    checkAll: function(component, event, helper) {
        console.log('checkebox checked');
    var master = component.find("master");
    var boxPack = component.find("dependent");

    var val = master.get("v.value");

    if (val == true) {
        for (var i = 0; i < boxPack.length; i++) {
            boxPack[i].set("v.value", true);
             console.log('checkebox child checked');
        }
    } else {
        for (var i = 0; i < boxPack.length; i++) {
            boxPack[i].set("v.value", false);
        }
    }
	},
    checkAlone: function(component, event, helper) {
        console.log('checkebox singlely checked');
        console.log('master='+component.find("master").get("v.value"));
    var master = component.find("master");
        console.log('master reco='+master);
    var boxPack = component.find("dependent");
  console.log('event source='+event.getSource().get("v.value"));
    var val =event.getSource().get("v.value")
    if(val){
        if(!component.find("master").get("v.value")){
            var isToCheck = true;
            for (var i = 0; i < boxPack.length; i++) {
               if(boxPack[i].get("v.value")!=true){
               	  isToCheck = false;
               }
            }
            if(isToCheck){
                component.find("master").set("v.value", true);
                console.log('checking hte master');
            }
        }
    }else{
         if(component.find("master").get("v.value")){  
             console.log('unchecking master');
         	component.find("master").set("v.value", false);
         }
    }
	},
    saveMethod : function(component, event, helper) {
        console.log('in Save Method'); 
        var boxPack = component.get("v.items");
        for (var i = 0; i < boxPack.length; i++) {
               if(boxPack[i].action==true){
               	 console.log('checked='+boxPack[i].title);
               }
            }
    },
})