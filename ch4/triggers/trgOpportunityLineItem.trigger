/* 
    @name: trgOpportunityLineItem
    @description: Before insert trigger on OpportunityLineItem
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
trigger trgOpportunityLineItem on OpportunityLineItem (before insert) 
{
    Map<Id, List<String>> mapOpptyProdCode= new Map<Id, List<String>>(); 
    
    //check the trigger context
    if(Trigger.isInsert) {
    //loop through each Opportunity products which are getting inserted or updated.
        for(OpportunityLineItem optLineItem: Trigger.new) {
            //retrieved list of products based on OpportunityId
            List<String> lstProduct = 
        mapOpptyProdCode.get(optLineItem.OpportunityId);
        if(lstProduct == null) lstProduct = new List<String>();
            
        //add new product code into the list
        lstProduct.add(optLineItem.ProductCode);

        //finally put the list pertaining to OpportunityId
                mapOpptyProdCode.put(optLineItem.OpportunityId, lstProduct);  
            
        //assign Date value to 7 days from Today.
        if(optLineItem.ServiceDate == null) {
            optLineItem.ServiceDate = System.Today()+7;
        }
        }
        
    //retrieve list of line items which already exists in database.
        List<OpportunityLineItem> lstOpptyLineItem = 
            [SELECT OpportunityId, ProductCode
            FROM OpportunityLineItem 
            WHERE OpportunityId IN:mapOpptyProdCode.keySet()];
        
    //loop through the list of existing line item records
        for(OpportunityLineItem optyli: lstOpptyLineItem) {
            List<String> lstProduct = 
            mapOpptyProdCode.get(optyli.OpportunityId);
        //compare the product code
        if(lstProduct.contains(optyli.ProductCode)) {
            //collect the error to show
                    optyli.addError('Product code ' 
            + optyli.ProductCode + ' already exists');
            }
        }       
    }
}