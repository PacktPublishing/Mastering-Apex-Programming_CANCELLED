/* 
    @name: trgOpportunityLineItem2
    @description: This trigger has been refactored 
        and calling trigger handler to perform the operations.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger trgOpportunityLineItem2 on OpportunityLineItem (before insert) {
    if(Trigger.isInsert){
        OpportunityLineItemTriggerHandler.onBeforeInsert(Trigger.new);
    }
}