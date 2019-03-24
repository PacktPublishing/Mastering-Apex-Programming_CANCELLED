/* 
    @name: OpportunityTrigger
    @description: Trigger on Opportunity and performing before update operation.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
trigger OpportunityTrigger on Opportunity(before update){
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
    handler.OnBeforeUpdate(Trigger.old,Trigger.new,Trigger.oldMap, Trigger.newMap);
}