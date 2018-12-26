({
        

 navigateIt : function(component,event,helper)
{
        var navigate = $A.get("e.force:navigateToURL");
        navigate.setParams({ "url" : "http://www.google.com"});
        navigate.fire();
}
})