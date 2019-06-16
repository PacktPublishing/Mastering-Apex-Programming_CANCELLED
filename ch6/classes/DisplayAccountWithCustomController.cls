/**
    * @name:        DisplayAccountWithCustomController
    * @author:      Santanu Pal   
    * @date:        2 JAN 2019
    * @description: This Apex Class is used to return 5 Account records to the Visualforce Page
    
    CopyRight (c) 2019
**/

public class DisplayAccountWithCustomController{  
          
      public List<Account> getAccounts(){  
         return [SELECT  ID,  
                         Name,  
                         AccountNumber,  
                         Type,  
                         Industry  
                         FROM Account   
                         LIMIT 5];                           
     } 
   
}