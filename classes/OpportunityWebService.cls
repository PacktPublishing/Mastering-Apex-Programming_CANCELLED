/* 
    @name: OpportunityWebService
    @description: The class is getting called from external system. 
            It verifies Invoice Amount (which is passed as request body) is equal to Opportunity Amount.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
@RestResource(urlMapping='/OpportunityWebService/v1/*')
global with sharing class OpportunityWebService {

    @HttpPost
    global static String updateOpportunity(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        
        try {
            Id opptyId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            Decimal invoiceAmount = Decimal.valueOf(req.requestBody.toString());
            
            //retrieve the value of Opportunity Amount
            Opportunity opty = [SELECT Id, Invoice_Amount__c, Amount 
                                FROM Opportunity WHERE Id =:opptyId];
            
            if(invoiceAmount !=null && (invoiceAmount != opty.Amount)) {
                throw new MyCustomException('Invoice Amount must be equal to Opportunity Amount');
            }
            update opty;
            return opty.Id;
        }catch (Exception ex) {
            return ex.getMessage();
        }
   }
}