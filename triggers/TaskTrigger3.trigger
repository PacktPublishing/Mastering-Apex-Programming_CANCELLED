/* 
    @name: TaskTrigger3
    @description: This trigger has been refactored from TaskTrigger.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger TaskTrigger3 on Task(after insert) {
    if(trigger.isInsert && trigger.isAfter) {
        //create a map firing SOQL query based on Ids of after trigger context variable
        Map<Id,Task> mapNewTaskToUpdate = new Map<Id,Task>([SELECT Id, 
                                SLA_Closure_Date__c 
                                FROM Task 
                                WHERE Id IN:Trigger.new]);
       
        //loop through all the tasks which has got inserted.           
        for(Task objTask:Trigger.new) {
            //retrive the task object from the map based on TaskId
            Task newObjTask = mapNewTaskToUpdate.get(objTask.Id);           
            //assign values
            newObjTask.SLA_Closure_Date__c = 
            BusinessHoursServices.getSLATimeByBusinessHour(objTask.createdDate,
            Integer.valueOf(System.Label.SLA_Hours)); 
        }
        
        //finally update the list of tasks.
        update mapNewTaskToUpdate.values();
    }
}