public class contentController {

    public contentController() {
        file = new ContentVersion();
    }
    
    public ContentVersion file { get; set; }
    
    public PageReference go() {
        insert file;
        return new PageReference('/' + file.id);
    }
}