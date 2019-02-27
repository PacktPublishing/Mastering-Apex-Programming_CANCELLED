/* 
    @name: TaskTrigger
    @description: This trigger performs after insert relation operations.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger TaskTrigger on Task(after insert)  {  
    if(trigger.isInsert && trigger.isAfter) {  
       List<Task> lstTask = Trigger.new;  
       
       //loop through the task records which are getting inserted.
       for(Task objTask:lstTask) {  
            //try to assign values directly to task's attibute and try to find out what will happend
            objTask.SLA_Closure_Date__c = 
            BusinessHoursServices.getSLATimeByBusinessHour(objTask.createdDate,
                                            Integer.valueOf(System.Label.SLA_Hours));                      
        }   
  
        update lstTask;  
    }  
}