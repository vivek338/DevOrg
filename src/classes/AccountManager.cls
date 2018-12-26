@RestResource(urlMapping='/Accounts/*/Contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        // grab the AccountId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
         Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accountId];
        return acc;
    }
}