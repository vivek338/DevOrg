trigger AccountAddressTrigger on Account (before insert, before update) {
           
        For(Account acc : Trigger.New ){
            IF(acc.BillingPostalCode != null && acc.Match_Billing_Address__c==true){
                acc.ShippingPostalCode = acc.BillingPostalCode;                                
            }
        }
        
}