public class testhtml {

    
    
    List<integer> strLst = new List<integer>();
    public List<Account> accLst {get;set;}
    public List<wrapperAccCon> wrapperAccConLst {get;set;}
    public  List<wrapperAccCon> selwrapperAccConLst {get;set;}
       public List<Account> accts {get;set;}
    
    public testhtml(){
        this.accts = new List<Account>();
        this.wrapperAccConLst = new List<wrapperAccCon>();
        this.accLst = new List<Account>();
        List<Account> accs = [Select Id, Name, (Select Id, FirstName, LastName From Contacts) From Account ];
        this.accLst = accs;
        List<wrapperAccCon> wraps=new List<wrapperAccCon>();
        for(Account a:accs){
        wrapperAccCon wrap = new wrapperAccCon(a, a.contacts);
            wraps.add(wrap);
        }
        wrapperAccConLst.addAll(wraps);
    }
    
    public List<Contact> getlistOfitems(){
        
        for(integer i=0; i<=10; i++){
            strLst.add(i);
            system.debug(strLst);
        }
        List<Contact> conLst = [select id, name from contact limit 12];
        system.debug('final strlst'+strLst);
        system.debug('count of conLst'+conLst.size());
    return conLst;
    }
    
    public PageReference save(){
        insert accts;
        PageReference pg = new PageReference('/home/home.jsp');
        pg.setRedirect(true);
        return pg;
    }
    
    public void addRow(){
        accts.add(new Account());
    }
    
    
    
    public List<String> getMonths(){
        List<string> monthLst = new List<String>{'January', 'Feburary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'NOvember', 'December'};
        return monthLst;
    }
    
    public List<vivek338__Bus__c> getPrice(){
       List<vivek338__Bus__c> priceLst =[select id, name, vivek338__Price__c from vivek338__Bus__c];
        return priceLst;
    }
    
    public List<String> getNumbers(){
        List<String> strLst = new List<String>{'1', '2', '3', '4', '5', '6','7', '8', '9','10', '11', '12'};
        return strLst;
    }
    
    public void ProcessSelected(){
       
       selwrapperAccConLst = new List<wrapperAccCon>();
        for(wrapperAccCon wpac: wrapperAccConLst){
            if(wpac.checkbox==true){
                selwrapperAccConLst.add(wpac);
            }
        }
       
    }
        
    public class wrapperAccCon{
        
        public Account acc{get;set;}
        public List<contact> con{get;set;}
        public boolean checkbox{get;set;}
        public string inputbox{get;set;}
        
        public wrapperAccCon(Account accs, List<Contact> cons){
            this.acc = accs;
            this.con = cons;
            this.checkbox=false;
            this.inputbox = 'Hi..';
        }
    }
    /*
     Map<id,Resource_PPMC__c> resPPMCMap = new Map<id,Resource_PPMC__c>([SELECT Id, Resource__c, Name, Actual_Hrs__c, External_ID__c, Month__c, 
Resource_Category__c, Resource_Type__c, Actuals__c, Actual_Diff_Forecast__c, Month_in_Text__c from Resource_PPMC__c 
where Project_Assignment__c='a5p180000008RSw' order by Resource__c, Month__c]); 
List<Resource_PPMC__c> selResPPMCLst = new List<Resource_PPMC__c>(); 

system.debug('resPPMCMap'+resPPMCMap);
system.debug('resPPMCMap size::'+resPPMCMap.size());
system.debug('resPPMCMap keyset::'+resPPMCMap.keyset());
system.debug('resPPMCMap keyexist::'+resPPMCMap.containsKey('a5q180000001eEkAAI'));
system.debug('resPPMCMap get value'+resPPMCMap.get('a5q180000001eEkAAI'));
system.debug('resPPMCMap values::'+resPPMCMap.values());
system.debug('resPPMCMap values size::'+resPPMCMap.values().size());
for(Resource_PPMC__c rp: resPPMCMap.values()){
    if(rp.resource__c=='a5o180000001Zd4AAE'){
        selResPPMCLst.add(rp);
    }
}
system.debug('selResPPMCLst'+selResPPMCLst);
system.debug('selResPPMCLst size'+selResPPMCLst.size());
return  selResPPMCLst;

public ResourcePPMCWrapper{
public Resource__c res{get;set;}
public List<Resource_PPMC__c> resPPMCLst{get;set;}
public ResourcePPMCWrapper(Rsource__c re, List<Resource_PPMC__c> resPPmc){
	this.res=re;
	this.resPPMCLst=resPPmc;
}
}

List<resource__c> resLst = new List<resource__c>();
for(Resource_PPMC__c rp: resPPMCMap.values()){
	if(resLst.contains(rp.resource__c){
		selResPPMCLst.add(rp);
	}
	else {
		resLst.add(rp.resource__c);
		selResPPMCLst.add(rp);
	}
	else{
		
		ResourcePPMCWrapper respp = new ResourcePPMCWrapper(rp.resource__c, selResPPMCLst);
		selResPPMCLst.clear();
	}
    if(rp.resource__c=='a5o180000001Zd4AAE'){
        selResPPMCLst.add(rp);
    }
}
ResourcePPMCWrapper respp = new ResourcePPMCWrapper(rp.resource__c, selResPPMCLst);

/////////////////////////////////
List<ResourcePPMCWrapper> ResourcePPMCWrapperLst = new List<ResourcePPMCWrapper>();
set<id> ResourcebasedPPMCLst = new set<id>();
List<Resource_PPMC__c> selcResPPMcRec = new List<Resource_PPMC__c>();
for(Resource_PPMC__c rp: resPPMCMap.values()){
	if(ResourcebasedPPMCLst.contains(rp.resource__c)){
	}
	else{
			ResourcebasedPPMCLst.add(rp.resource__c);
	}
}	

for(id i: ResourcebasedPPMCLst){
	selcResPPMcRec.clear();
	for(Resource_PPMC__c rp: resPPMCMap.values()){
		if(i==rp.resource__c){
			selcResPPMcRec.ad(rp);
		}
	}
	ResourcePPMCWrapper reswrapper = new ResourcePPMCWrapper(i, selcResPPMcRec);
	ResourcePPMCWrapperLst.add(reswrapper);
}	
	
//////////////////////////////////////////	
	
	
for(Resource_PPMC__c rp: resPPMCMap.values()){
	if(mapResourcebasedPPMCLst.containskey(rp.resource__c)){
		selcResPPMcRec.add(rp);
		mapResourcebasedPPMCLst.put(rp.resource__c,selcResPPMcRec);
	}
	else{
		selcResPPMcRec.clear();
		mapResourcebasedPPMCLst.put(rp.resource__c,selcResPPMcRec);
	}
	
	
	
	
	
	
	
	
	
	
	 
     */
}