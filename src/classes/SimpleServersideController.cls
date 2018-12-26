public with sharing class SimpleServersideController {

    @AuraEnabled
    public static string serverEcho(string firstname){
        
        return ('Hello..!! from server:'+firstname);
    }    

}