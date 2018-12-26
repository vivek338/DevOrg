public class vfAppPageController  {
    
    public string inputValue{get;set;}
    public List<String> lMonths{get;set;}
    public boolean RenderSection{get; set;}
   
    
    public List<vivek338__Bus__c> lBuses = new List<vivek338__Bus__c>();
   //public List<String> lMonths = new List<String>();
    
    public List<vivek338__Bus__c> getLBuses(){
        return lBuses;
    }
    /*
    public List<String> getLMonths(){
        return lMonths;
    }
    */
	public void ShowFields() {
        RenderSection= true;
        system.debug('RenderSection changed to =='+RenderSection);
       // PageReference InputCase = new PageReference('/apex/GADCase?ID='+ApexPages.currentPage().getParameters().get('ID'));
        //return null;
        
   }	
    
    public void AddRow()
    {
       List<vivek338__Bus__c> Buses=New List<vivek338__Bus__c>();
        system.debug('inside addrow method');
        system.debug('lBuses'+lBuses.size());
        for(vivek338__Bus__c NewBus:lBuses){
            system.debug('inside addrow method for looop');
        Buses.add(NewBus);
        }
        lBuses.addAll(Buses);
      
    } 
    
    public vfAppPageController(){
        RenderSection=false;
        system.debug('RenderSection=='+RenderSection);
        List<vivek338__Bus__c> busLst =[select id, name, vivek338__Type__c, vivek338__Email__c, vivek338__Desitination__c from vivek338__Bus__c where vivek338__Active__c=true];
        for(vivek338__Bus__c bus: busLst){
            lBuses.add(bus);
        }
        lMonths = new List<String>();              
lMonths.add('January');
lMonths.add('Feburary');
lMonths.add('March');
lMonths.add('April');
lMonths.add('May');
lMonths.add('June');
lMonths.add('July');
lMonths.add('August');
lMonths.add('September');
lMonths.add('October');
lMonths.add('November');
lMonths.add('December');
system.debug('lMonths'+lMonths);
        
    }

}