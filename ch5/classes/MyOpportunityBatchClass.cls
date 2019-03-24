/* 
    @name: MyOpportunityBatchClass
    @description: Batch class to process updating Opportunity records. 
        It verifies Invoice Amount is equal to Opportunity Amount.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
global class MyOpportunityBatchClass implements Database.Batchable<sObject>,
                                                Database.Stateful {
                                                    
    global List<String> lstException = new List<String>();                                                 
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        return Database.getQueryLocator(
            'SELECT ID, Invoice_Amount__c, Amount ' +
            'FROM Opportunity ' + 
            'Where CreatedDate > LAST_QUARTER'
        );
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> records){
        // process each batch of records
        List<Opportunity> lstOppty = new List<Opportunity>();
        
        for (Opportunity objOppty : records) {
            try{
                if(objOppty.Invoice_Amount__c != null 
                    && (objOppty.Invoice_Amount__c != objOppty.Amount)) {
                        objOppty.Invoice_Amount__c = null;
                throw new MyCustomException('Error occured for updating Id:'+ objOppty.Id 
                                            + 'Msg:Invoice Amount must be equal to Opportunity Amount');                    
                }               
                //perform other processing for batch operations....
                
            }catch (Exception ex)
            {
                lstException.add(ex.getMessage());
            }
            lstOppty.add(objOppty);
        }
        Database.update(lstOppty,false);
            
        
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        if(!lstException.isEmpty()) {           
            //you could sent an email or store in the object.
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSubject('Errors occurred during batch execution');
            mail.setTargetObjectId(UserInfo.getUserId());
            mail.setSaveAsActivity(false);
            mail.setPlainTextBody(JSON.serialize(lstException));
            Messaging.sendEmail(new Messaging.Email[] { mail });
        }
    }    
}