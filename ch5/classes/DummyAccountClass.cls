/* 
    @name: DummyAccountClass
    @description: Create Account record and returns the AccountId.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
public class DummyAccountClass {
    //create Account based on Name
    public String createAccount(String strName) {
        try{
            Account acct = new Account (Name=strName);
            insert acct;
            return acct.Id;            
        }catch (DMLException de) {
            //this will return 'Required fields are missing'
            return de.getDMLMessage(0);
        }
    }
}