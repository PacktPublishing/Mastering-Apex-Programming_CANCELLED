/**
    * @name:        CaptureAccountInfoController 
    * @author:      Santanu Pal   
    * @date:        2 JAN 2019
    * @description: This Apex Class is used to upsert record
    
    CopyRight (c) 2019
**/
public class CaptureAccountInfoController {

    public Account accountObj{get;set;}
    
    /*Search Account by Name from URL*/
    
    public CaptureAccountInfoController(){
        String accountName = ApexPages.currentPage().getParameters().get('name');
        
       accountObj = (accountName == null) ? new Account() : 
                                            [SELECT Name, 
                                                    AccountNumber, 
                                                    Type,
                                                    Industry FROM Account WHERE Name = :accountName];

    }
    
   /* upsert the Account record */
   
   public PageReference save() {
        try {
            upsert(accountObj);
        } catch(DMLException ex) {
            ApexPages.addMessages(ex);
            return null;
        }
        
        PageReference redirectAccountView = new ApexPages.StandardController(accountObj).view();
        return (redirectAccountView);
    }    
    
}