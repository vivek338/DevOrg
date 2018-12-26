public class RollupClass {
    
    public static void RollupMethod(List<SObject> newRecords, List<SObject> oldRecords, String ParentObjName, String ParentObjRelName, String RollupDispField, String RollupTobeField, 
                                    Boolean isInsert, Boolean isUpdate, Boolean isDelete, Boolean isUndelete){
        
        system.debug('newRecords='+newRecords);
        system.debug('oldRecords='+oldRecords);
        system.debug('ParentObjName='+ParentObjName);
        system.debug('ParentObjRelName='+ParentObjRelName);                               
        system.debug('RollupDispField='+RollupDispField);
        system.debug('RollupTobeField='+RollupTobeField);
                                        
      //  if(isUpdate){
            if(newRecords.size()>0 || oldRecords.size()>0){
                string objName='';
                if(newRecords.size()>0){
                objName = String.ValueOf(newRecords[0].getSObjectType());
                }
                else{
                objName = String.ValueOf(oldRecords[0].getSObjectType());    
                }
                system.debug('ObjName='+objName);
                
            	
                string query = 'Select id, name, '+
                    			''+ParentObjRelName+', '+
                    			''+RollupTobeField+''+
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
                
                List<SObject> sObjLst= Database.query(query);
                system.debug('sObjLst size='+sObjLst.size());
                Map<Id, SObject> sobjMap = new Map<id, SObject>();
                sobjMap.putAll(sObjLst);
                system.debug('sobjMap size='+sobjMap.size());
                Map<string, Integer> mapToUpdate = new Map<string, Integer>();
                for(Sobject sobj: trigger.new){
                    if(sobjMap.containsKey(sobj.id)){
                        SObject ob = sobjMap.get(sobj.id);
                        system.debug('ob='+ob);
                        system.debug('ob RollupTobeField value='+ob.get(RollupTobeField));
                        system.debug('ob ParentObjRelName value ='+ob.get(ParentObjRelName));
                        
                        if(mapToUpdate.containsKey(String.ValueOf(ob.get(ParentObjRelName)))){
                          integer valueToUpd = mapToUpdate.get(String.ValueOf(ob.get(ParentObjRelName)));
                            system.debug('valueToUpd before='+valueToUpd);
                           valueToUpd=valueToUpd+(Integer.ValueOf(ob.get(RollupTobeField)));
                            system.debug('valueToUpd after='+valueToUpd);
                            mapToUpdate.put(String.ValueOf(ob.get(ParentObjRelName)), valueToUpd);
                            system.debug('mapToUpdate after='+mapToUpdate);
                            
                        }
                        else{
                            mapToUpdate.put(String.ValueOf(ob.get(ParentObjRelName)), Integer.ValueOf(ob.get(RollupTobeField)));
                        } 
                        system.debug('mapupdate get='+mapToUpdate.get(String.ValueOf(ob.get(ParentObjRelName))));
                        
                    }
                    system.debug(mapToUpdate); 
                    
                    
                    
					
                }
                for(string obid: mapToUpdate.keyset()){
                        Schema.SObjectType t = Schema.getGlobalDescribe().get(ParentObjName); // obtain sObject description from the schema
                        SObject s = t.newSObject(); // create a new instance of that sObject
                        s.put(RollupDispField, mapToUpdate.get(obid) ); // set name
                        s.put('id', obid);
                        system.debug('s::'+s);
                       //  update s;
                        
                    }
            }
        }
	    
    private static void RollupCalculateMethod(List<SObject> newRecords, List<SObject> oldRecords, String ParentObjName, String ParentObjRelName, String RollupDispField, String RollupTobeField, 
                                    Boolean isInsert, Boolean isUpdate, Boolean isDelete, Boolean isUndelete){
        
    }

}