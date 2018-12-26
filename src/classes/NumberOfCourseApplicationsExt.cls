public class NumberOfCourseApplicationsExt {
    public integer numOfCourseApplications {get;set;}
    public NumberOfCourseApplicationsExt(ApexPages.standardController controller)
    {
        numOfCourseApplications = 0;
        numOfCourseApplications = [select count() from Course_Application__c where Status__c = 'conditional Approval' and Course__c =:ApexPages.CurrentPage().getParameters().get('id')];
    }
}