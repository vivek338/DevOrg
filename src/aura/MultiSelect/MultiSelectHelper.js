({
  setInfoText: function(component, labels) {
    
    if (labels.length == 0) {
      component.set("v.infoText", component.get('v.defaultText'));
    }
    if (labels.length == 1) {
      component.set("v.infoText", labels[0]);
    }
    else if (labels.length > 1) {
      component.set("v.infoText", labels.length + " options selected");
    }
  },

  getSelectedValues: function(component){
    var options = component.get("v.options_private");
    var values = [];
    options.forEach(function(element) {
      if (element.selected) {
        values.push(element.value);
      }
    });
    return values;
  },

  getSelectedLabels: function(component){
    var options = component.get("v.options_private");
    var labels = [];
    options.forEach(function(element) {
      if (element.selected) {
        labels.push(element.label);
      }
    });
    return labels;
  },

  despatchSelectChangeEvent: function(component,values){
    var compEvent = component.getEvent("SelectChange");
    compEvent.setParams({ "values": values });
    compEvent.fire();
  }
})