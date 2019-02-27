/* 
    @name: LeadTrigger
    @description: Example of Lead trigger will all types of events
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger LeadTrigger on Lead(before insert, before update, 
                after insert, after update, 
                after undelete) {
                                
    LeadTriggerHandler handler = new LeadTriggerHandler();
    
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            handler.OnBeforeInsert(Trigger.new, Trigger.newMap);
        }
        when BEFORE_UPDATE{
            handler.OnBeforeUpdate(Trigger.old, Trigger.new, 
                        Trigger.oldMap, Trigger.newMap);
        }
    when BEFORE_DELETE {
        handler.OnBeforeDelete(Trigger.old, Trigger.oldMap);
    }
    when AFTER_INSERT {
        handler.OnAfterInsert(Trigger.new,Trigger.newMap);
    }           
    when AFTER_UPDATE {
        handler.OnAfterUpdate(Trigger.old, Trigger.new, 
                Trigger.oldMap, Trigger.newMap);
    }
    when AFTER_DELETE {
        handler.OnAfterDelete(Trigger.old, Trigger.oldMap);
    }
    when AFTER_UNDELETE {
        handler.OnAfterUndelete(Trigger.new, Trigger.newMap);
    }       
    }
}