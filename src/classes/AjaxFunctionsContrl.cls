public class AjaxFunctionsContrl{

public string selVal{get;set;}
public string styleInfo{get;set;}

    public AjaxFunctionsContrl(){
        selVal='India';
        styleInfo='font-weight:bold;color:blue';
    }
    public void changeColor(){
        styleInfo='font-weight:bold;color:red';
    }
    public List<SelectOption> getOptions(){
    List<SelectOption> conOptions = new List<SelectOption>();
    for(String country: countryISTcode__c.getAll().keyset()){
        conOptions.add(new SelectOption(country, country));
    }
    return conOptions;
    }


}