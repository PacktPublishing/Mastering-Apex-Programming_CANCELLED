/*
    @name: ExampleOfMixedDMLClass
    @description: Example of showing mixed DML operation
    @author: Santanu Boral
    @date: 2 JAN 2019
    
    CopyRight (c) 2019  
*/
public class ExampleOfMixedDMLClass {
    public static void insertTransactionalObjects() {
        
        //insert account
        Account acct = new Account(Name = 'New Account');
        insert acct;

        //insert contact
        Contact conObj = new Contact(FirstName = 'John', 
                    LastName = 'Smith',
                    Email='John.Smith@abc.com',     
                    AccountId=acct.Id);
        insert conObj;
        
        //call this method to insert user asynchronously
        UtilityClass.insertSetupObjects('John', 'Smith', 
                    'John.Smith@abc.com',conObj.Id);       
    }
}