/* 
    @name: CaseTriggerHandler2
    @description: This trigger handler prepares and sends emails.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
public class CaseTriggerHandler2{
    
    //declare static variable to hold case Ids
    public static Set<Id> caseIds = new Set<Id>();
    
    public static void OnAfterUpdate(List<Case> oldList, List<Case> newList, 
                                Map<Id,Case> oldMap, Map<Id,Case> newMap){
            for(Case objCase: newList)  { 
            if(oldMap.get(objCase.Id).Description != objCase.Description) {
                //prepare email
                Utility.prepareEmail(objCase.OwnerId, 
                'Case ' + objCase.CaseNumber + 
                        ' has been updated', 'Please review the Case');
                        caseIds.add(objCase.Id);
            }
        }
        Utility.sendEmail();
    }   
}