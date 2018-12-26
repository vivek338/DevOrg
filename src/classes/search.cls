public class search {
    
    /*
     <apex:page controller="SelectTimePeriod_VFController">
    <apex:form >
        <script>
        function switchMenu(obj,obj1,obj2) 
        {
            var el = document.getElementById(obj);                                       
            if ( el.style.display != 'none' ) {
                el.style.display = 'none';
            }
            else {
                el.style.display = '';
            }
            var e2 = document.getElementById(obj1);                                       
            if ( e2.style.display != 'none' ) {
                e2.style.display = 'none';
            }
            else {
                e2.style.display = '';
            }
            var e3 = document.getElementById(obj2);                                       
            if ( e2.style.display != 'none' ) {
                e3.style.display = 'none';
            }
            else {
                e3.style.display = '';
            }
            
        }
        </script>
        <apex:pageBlock title="Select Start and End Date" rendered="{!!isDateSelected }">
            <apex:pageBlockSection >
                <apex:inputField value="{!resourceManager.Manager__c}"/><br/>
                <apex:inputField value="{!projectDetails.Project_Start_Date__c}"/>
                <apex:inputField value="{!projectDetails.Project_End_Date__c}"/>
                <center><apex:commandButton action="{!showData}" value="Show"/></center>
            </apex:pageBlockSection>
        </apex:pageBlock>
        <apex:pageBlock title="Selected Start/End Date"  rendered="{!isDateSelected}">
            <b>Manager:</b> &nbsp;<apex:outputField value="{!resourceManager.Manager__c}"/><br/><br/>
            <b>Start Date:</b> &nbsp;<apex:outputField value="{!projectDetails.Project_Start_Date__c}"/>
            <br/>
            <b>End Date:</b> &nbsp;<apex:outputField value="{!projectDetails.Project_End_Date__c}"/>
            <br/><br/><apex:commandLink action="{!setDate}" value="Go Back..."/>
        </apex:pageBlock>
        <apex:pageBlock title="Project and Resource Details" rendered="{!isDateSelected }">
            <apex:pageBlockTable value="{!projectList}" var="project">
                <apex:column >
                    <apex:facet name="header">                                        
                        Resources                                                                               
                    </apex:facet>
                    <apex:outputpanel id="plusimage">
                        <apex:image url="{!$Resource.Plus_Image}" onclick="switchMenu('{!$Component.inlinetablesec}','{!$Component.minusimage}','{!$Component.plusimage}')" title="Expand - Team Member's"/> 
                    </apex:outputpanel>
                    <apex:outputpanel id="minusimage" style="display:none;">
                        <apex:image url="{!$Resource.Minus_Image}" onclick="switchMenu('{!$Component.inlinetablesec}','{!$Component.plusimage}','{!$Component.minusimage}')" title="Collapse - Team Member's"/>
                    </apex:outputpanel>
                    <apex:outputpanel id="inlinetablesec" style="display:none;">
                                               Test
                   </apex:outputpanel> 
                </apex:column>
                <apex:column >
                    <apex:facet name="header">Project Name</apex:facet>
                    <apex:outputField value="{!project.name}"/>
                </apex:column>
                <apex:column >
                    <apex:facet name="header">Project Start Date</apex:facet>
                    <apex:outputField value="{!project.Project_Start_Date__c}"/>
                </apex:column>
                <apex:column >
                    <apex:facet name="header">Project End Date</apex:facet>
                    <apex:outputField value="{!project.Project_End_Date__c}"/>
                </apex:column>
            </apex:pageBlockTable>
        </apex:pageBlock>
    </apex:form>
</apex:page>
                   
      */
    
    /*
     public with sharing class SelectTimePeriod_VFController {

    public Project__c projectDetails {get; set;}
    public Resource__c resourceManager {get; set;}
    public List<Project__c> projectList {get; set;}
    public static Boolean isDateSelected {get; set;} 
    public static String Check{get; set;}  
    
    public SelectTimePeriod_VFController() {
        projectDetails = new Project__c();
        resourceManager = new Resource__c();
        isDateSelected = false;
    }
    
    public PageReference ShowData(){
        Date startDate = projectDetails.Project_Start_Date__c;
        Date endDate = projectDetails.Project_End_Date__c;
        projectList = [select Id, Project_Start_Date__c, Project_End_Date__c, Name from Project__c where Project_Start_Date__c >= :startDate
                                       AND Project_End_Date__c <= :endDate AND Project_Manager__c = :resourceManager.Manager__c]; 
        
        Integer monthDiff = startDate.monthsBetween(endDate);
        System.debug('$$$$$Check: '+ monthDiff);
        if (endDate.day() > startDate.day()) monthDiff++;
        isDateSelected = true;
        return null;
    }
    
    public PageReference setDate(){
        isDateSelected = false;
        return null;
    }
}
     */ 

}