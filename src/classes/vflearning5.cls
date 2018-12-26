public class vflearning5 {
    
    public string var{get;set;}

    public void callnumbers() {
        string each_endpointis = Apexpages.currentpage().getParameters().get('each_url');
        system.debug('var::'+var);
        system.debug('each_endpointis'+each_endpointis);
       // return null;
    }


    

}