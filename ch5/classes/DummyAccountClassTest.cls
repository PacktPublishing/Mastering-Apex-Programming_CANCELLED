/* 
    @name: DummyAccountClassTest
    @description: This class tests the functionality written in DummyAccountClass.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
@isTest
public class DummyAccountClassTest {
    @isTest
    public static void testCreateAccount()  {
        DummyAccountClass dac = new DummyAccountClass();
        //try to create Account with a name 'TestAccount A'
        String strId = dac.createAccount('TestAccount A');
        
        //verify the account creation with the returned Id.
        String strName = [SELECT Name from Account 
                            WHERE Id=:strId].Name;
        System.assertEquals('TestAccount A', strName); //Expected vs. Actual
    }
    
    @isTest
    public static void negetiveTestCreateAccount() {
        DummyAccountClass dac = new DummyAccountClass();
        String strMsg = null;        
            strMsg = dac.createAccount(''); //this line generates error.
        
        //assert the msg content.       
        System.assertEquals(true, 
                strMsg.contains('Required fields are missing'));  
    }
}