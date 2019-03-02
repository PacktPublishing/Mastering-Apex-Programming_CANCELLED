/* 
    @name: CaseTriggerHandler
    @description: This trigger handler performs operations of trigger.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
public class CaseTriggerHandler {
    public void stopTaskOwnerChangeOnCase(List<Case> lstNewCases, 
            Map<Id,Case> mapOldCases) {
        List<Task> lstTasks = new List<Task>();
        Map<Id,case> mapOfCases = new Map<Id,case>();
        
        //Holding Case Information on Map at the time of  Case ownership change
        for(case objCase:lstNewCases) {
            String oldOwnerId = mapOldCases.get(objCase.Id).ownerId;
            String newOwnerid = objCase.ownerId;            
            if(!newOwnerid.equalsIgnoreCase(mapOldCases.get(objCase.Id).ownerId) 
               && oldOwnerId != null && oldOwnerId.subString(0,3) == '005') {               
                mapOfCases.put(objCase.Id,objCase);               
            }                
        }
        //Fetching non closed Task Information based on Case Id's
        for(Task objTask:[SELECT Id,
                          OwnerId,
                          Last_Owner__c  
                          FROM task 
                          WHERE Whatid IN: mapOfCases.keySet() 
                          AND IsClosed <> TRUE 
                          AND Last_Owner__c <> null]) {
            //Comparing current Owner & Last Owner Field Values
            if(objTask.OwnerId <> objTask.Last_Owner__c) {
                //If Current Owner & Last owner is different again reassiging the Last Owner as Task Owner
                objTask.OwnerId = objTask.Last_Owner__c;
                lstTasks.add(objTask);
            }
        }            
        update  lstTasks;  
    }
}