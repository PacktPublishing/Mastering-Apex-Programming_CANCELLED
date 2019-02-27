/*
    @name: LeadTriggerHandler
    @description: Here we have shown a template of Trigger Handler with all events
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
public class LeadTriggerHandler{
    
    public void OnBeforeInsert(List<Lead> newList, Map<Id,Lead> newMap) {
        //perform before insert related operation like validations
    }
    
    public void OnBeforeUpdate(List<Lead> oldList, List<Lead> newList, 
                                Map<Id,Lead> oldMap, Map<Id,Lead> newMap){
        //perform before update related operation like validations
    }
    
    public void OnBeforeDelete(List<Lead> newList, Map<Id,Lead> newMap) {
        //perform before delete related operation like validations
    }
    
    public void OnAfterInsert(List<Lead> newList, Map<Id,Lead> newMap){
        //perform post insert operations, like create related records of Child objects, 
        //or send emails, or perform webservice callouts
    }
    
    public void OnAfterUpdate(List<Lead> oldList, List<Lead> newList, 
                                Map<Id,Lead> oldMap, Map<Id,Lead> newMap){
        //perform post update operations, 
        //like create/update related records of Child objects, 
        //or send emails, or perform webservice callouts
    }
    
    public void OnAfterDelete(List<Lead> oldList, Map<Id,Lead> oldMap){
        //perform post delete operations, 
        //like deleting related records of Child objects, 
        //or send emails, or perform webservice callouts
    }
    
    public void OnAfterUndelete(List<Lead> oldList, Map<Id,Lead> oldMap){
        //perform post undelete operations, 
        //like creating/recovering related records of Child objects, 
        //or send emails, or perform webservice callouts
    }   
}