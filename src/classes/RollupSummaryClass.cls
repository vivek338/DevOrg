/* Created For Roll-up Summary Functionality Based on User Inputs
 * Can Be used For Any Rollup Summary Functinoality mentioning the following inputs
 * Child Object Rlationship Name - ChildObjRelName
 * Field Which is To Get Updated to Display - RollupDispField
 * Field which is To Be Considerd To Rollup- RollupTobeField
 * Provide their API Names, along with NameSpace if you have any
 * */

public class RollupSummaryClass {
    
    //Method To Calucate and Update the Fields - Same as Rollup Functionality
    public static void RollupMethod(List<SObject> newRecords, List<SObject> oldRecords, String ChildObjRelName, String RollupDispField, String RollupTobeField, 
                                    Boolean isInsert, Boolean isUpdate, Boolean isDelete, Boolean isUndelete){  
    
    if(newRecords.size()>0 || oldRecords.size()>0){
        string objName='';
        List<Sobject> listToProcess = new List<SObject>();
        if(newRecords.size()>0){
            objName = String.ValueOf(newRecords[0].getSObjectType());
            listToProcess.addAll(newRecords);
        }
        else{
            objName = String.ValueOf(oldRecords[0].getSObjectType());  
            listToProcess.addAll(oldRecords);
        }
        system.debug('ObjName='+objName);    
        //Prepareing the Query To Fetch The related Records
        string query = 'Select id, name, '+                                                
                        '(Select id, name, '+
                         ''+RollupTobeField+''+
                        ' FROM '+
                        ''+ChildObjRelName+' '+
                        ' WHERE (StageName!=\'Closed Won\' and StageName!=\'Closed Lost\'))'+
                        ' FROM '+
                        ''+objName+''+
                        ' WHERE Id ';
        
        if(isInsert || isUpdate || isUndelete){                 
            query=query+' in: newRecords';                    
        }
        else{
            query=query+' in: oldRecords';
        }
        
        system.debug('query==>'+query);
        
        List<SObject> sObjLst= Database.query(query); //Querying the Records

        Map<Id, SObject> sobjMap = new Map<id, SObject>(); 
        sobjMap.putAll(sObjLst); //Stroring the Queried records into a Map for furthur use
        
        Map<string, Integer> mapToUpdate = new Map<string, Integer>();
                
        for(Sobject sobj: listToProcess){
            if(sobjMap.containsKey(sobj.id)){
                SObject ob = sobjMap.get(sobj.id);                
                List<SObject> objlst = ob.getSObjects(ChildObjRelName);                
                integer amounttotal=0;
                for(Sobject opp: ob.getSObjects(ChildObjRelName)  ){                    
                    amounttotal=amounttotal+integer.valueOf(opp.get(RollupTobeField));                    
                }
                mapToUpdate.put(sobj.id, amounttotal);                      
            }
        }
        
        //preparing the list to update
        List<Sobject> objUpd= new List<Sobject>();
        for(string obid: mapToUpdate.keyset()){            
            Schema.SObjectType t = Schema.getGlobalDescribe().get(objName); 
            SObject s = t.newSObject(); 
            s.put(RollupDispField, mapToUpdate.get(obid) ); 
            s.put('id', obid);            
            objUpd.add(s);           
                        
        }     
        
        //updating the list 
        if(objUpd.size()>0){
        MetaDataConstants.AccountTriggerRecursiveCheck=true;
            update objUpd;
            MetaDataConstants.AccountTriggerRecursiveCheck=false;
        }
    }
                                        
    }

}