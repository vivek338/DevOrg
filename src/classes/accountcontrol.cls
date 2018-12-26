public class accountcontrol {
    
    public static string description;
    public static integer numb;

    public accountcontrol(){
        system.debug('inside constructor controller');
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
system.debug('response:'+response.getBody());
        
String jsonInput = '{\n' +
    ' "description" :"An appliance",\n' +
    ' "accessories" : [ "powerCord", ' + 
      '{ "right":"door handle1", ' + 
        '"left":"door handle2" } ],\n' +
    ' "dimensions" : ' + 
      '{ "height" : 5.5 , ' + 
        '"width" : 3.0 , ' + 
        '"depth" : 2.2 },\n' +
    ' "type" : null,\n' +
    ' "inventory" : 2000,\n' +
    ' "price" : 1023.45,\n' +
    ' "isShipped" : true,\n' +
    ' "modelNumber" : "123"\n' +
    '}';
    
Map<String, Object> m = 
   (Map<String, Object>)
      JSON.deserializeUntyped(jsonInput);
	  
System.debug('description:'+m.get('description'));
system.debug('inventory:'+m.get('inventory'));
        
        description = string.ValueOf(m.get('description'));
        numb = integer.ValueOf(m.get('inventory'));
    }

    public List<Account> getAccounts() {
    
        List<Account> accLst = [select id, name from account];
        return accLst;
    }
    
    public void concontrl(){
        system.debug('inside action controller');
        system.debug('description'+description);
        system.debug('numb'+numb);
    
    }

}