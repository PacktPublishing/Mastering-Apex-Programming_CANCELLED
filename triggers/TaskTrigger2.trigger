/* 
    @name: TaskTrigger2
    @description: This trigger code has been refactored from TaskTrigger.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger TaskTrigger2 on Task(after insert) {
    if(trigger.isInsert && trigger.isAfter) {
        //declare and instantiate List of tasks.
        List<Task> lstNewTaskToUpdate = new List<Task>();
       
        //loop through all the tasks which has got inserted.
        for(Task objTask:Trigger.new) {
            //Here is the important part.
            //create a new Task's object instance 
            //and assign values to that taking from Trigger's context variable
                    Task newObjTask = new Task(Id=objTask.Id, 
                SLA_Closure_Date__c = 
                        BusinessHoursServices.getSLATimeByBusinessHour(
                        objTask.createdDate,
                        Integer.valueOf(System.Label.SLA_Hours)
                    )
                ); 
            
        //collect task objects into the list.
                lstNewTaskToUpdate.add(newObjTask);
        }
        
    //finally update the list of tasks.
        update lstNewTaskToUpdate;
    }
}