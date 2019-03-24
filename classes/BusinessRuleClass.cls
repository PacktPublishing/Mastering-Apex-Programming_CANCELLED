/* 
    @name: BusinessRuleClass
    @description: It verifies Invoice Amount is equal to Opportunity Amount.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
public inherited sharing class BusinessRuleClass {    
    public static boolean validateOpportunity(Opportunity objOppty) {        
        if(objOppty.Invoice_Amount__c !=null 
            && (objOppty.Invoice_Amount__c!=objOppty.Amount)) {
            //throw new MyCustomException('Invoice Amount must be equal to Opportunity Amount');
            throw new MyCustomException(ExceptionUtils.getMessage('E001'));
        }
        
        //there could many other type of exceptions.
        return true;
    }
}