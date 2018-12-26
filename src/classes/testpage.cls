public class testpage{

    public PageReference dotestpage(){
    
    PageReference pageRef = new PageReference('/apex/hello');
    pageRef.setRedirect(true);
    return pageRef;
    
    }

}