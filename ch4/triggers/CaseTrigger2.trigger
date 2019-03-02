/* 
    @name: CaseTrigger2
    @description: This trigger is used to show how recursion should be handled.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger CaseTrigger2 on Case(after update) {
    
    if(Trigger.isUpdate && Trigger.isAfter){
        //check if static variable caseIds contains all the Case Ids
        if(!CaseTriggerHandler2.caseIds.containsAll(Trigger.newMap.keySet())) {            
            CaseTriggerHandler2.OnAfterUpdate(Trigger.old, Trigger.new, 
                Trigger.oldMap, Trigger.newMap);
        }       
    }
}