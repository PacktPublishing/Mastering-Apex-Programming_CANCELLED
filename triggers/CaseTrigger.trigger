/* 
    @name: CaseTrigger
    @description: This trigger fires on after update and send emails.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger CaseTrigger on Case(after update) {
    
    if(Trigger.isUpdate && Trigger.isAfter) {
        for(Case objCase: Trigger.new){ 
            if(Trigger.oldMap.get(objCase.Id).Description != objCase.Description) {
                //prepare email
                Utility.prepareEmail(objCase.OwnerId, 
                'Case ' + objCase.CaseNumber + ' has been updated', 
                        'Please review the Case');
            }
        }
        Utility.sendEmail();        
    }
}