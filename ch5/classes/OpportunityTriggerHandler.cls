/*
    @name: OpportunityTriggerHandler
    @description: Trigger handler to perform validation during update.
    @author: Santanu Boral
    @date: 2 JAN 2019
    
    CopyRight (c) 2019  
*/
public class OpportunityTriggerHandler{
    
    /*
    public void OnBeforeUpdate(List<Opportunity> oldList, List<Opportunity> newList, 
                                Map<Id,Opportunity> oldMap, Map<Id,Opportunity> newMap){
                               
        //perform before update related operation like validations
        for(Opportunity objOppty:newList) {
            //verify if Invoice amount is equal to Opportunity Amount.
            if(objOppty.Invoice_Amount__c!=null && (objOppty.Amount != objOppty.Invoice_Amount__c)) {
                objOppty.addError ('Invoice Amount must be equal to Opportunity Amount');
            }
            
        }
    }
    */

    public void OnBeforeUpdate(List<Opportunity> oldList, List<Opportunity> newList,   
                            Map<Id,Opportunity> oldMap, Map<Id,Opportunity> newMap){  
                             
        //perform before update related operation like validations  
        for(Opportunity objOppty:newList) {  
            try{  
                BusinessRuleClass.validateOpportunity(objOppty);  //call this method for validation
            }catch(Exception ex){  
                objOppty.addError(ex.getMessage());  
            }  
        }  
    }     
    
}