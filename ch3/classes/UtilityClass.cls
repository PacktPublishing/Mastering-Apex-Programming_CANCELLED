/*
    @name: UtilityClass
    @description: Common utility class for reusable methods and functionalities
    @author: Santanu Boral
    @date: 3 JAN 2019
    
    CopyRight (c) 2019  
*/
public class UtilityClass {
    @future
    public static void insertSetupObjects(String firstName, String lastName, 
    String email,String contactId)  {
        //retrieve profile information
        Profile objProfile = [SELECT Id FROM Profile WHERE Name='Customer Community User'];
       
        String sRandom = String.ValueOf(Integer.valueOf(
                        math.rint(math.random()*1000000))
                        );
        
        //create user
        User newUser = new User(
                    ProfileId = objProfile.Id,
                    Firstname=firstName,
                    Lastname=lastName,
                    Username = firstName + sRandom + '@xyz.com',                    
                    Alias = firstName.substring(0,2) + lastName.substring(0,2),
                    Email=email,
                    EmailEncodingKey='UTF-8',
                    LanguageLocaleKey='en_US',                    
                    LocaleSidKey='en_US',
                    TimeZoneSidKey='America/Chicago',
                    ContactId=contactId
                );
        insert newUser; 
    }
}