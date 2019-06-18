@RestResource(urlMapping='/JSONRestService')
global Class JSONSerializerRestAPIController{

    global static String contactInfoJSONString;
    
    global class ContactInfoWrapper{
        String firstName;
        String lastName;
        String title;
        String mobilePhone;      
        
        
        global ContactInfoWrapper(String firstName, String lastName, String title, String mobilePhone)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.title = title;
            this.mobilePhone = mobilePhone;
        }       
    }
    
    @HttpGet
    global static void doJSONSerialization(){
    
        List<Contact> contactList = [SELECT Id, FirstName, LastName, Title, MobilePhone FROM Contact LIMIT 2];
        List<ContactInfoWrapper> contactInfoWrapperList = new List<ContactInfoWrapper>();
        
        if(contactList <> NULL && !contactList.isEmpty()){
            for(Contact con : contactList){
                ContactInfoWrapper contactInfoWrapperObj = new ContactInfoWrapper(con.FirstName, con.LastName, con.Title, con.MobilePhone);
                contactInfoWrapperList.add(contactInfoWrapperObj);
            }
        }      
        
       if(contactInfoWrapperList <> NULL && !contactInfoWrapperList.isEmpty())
           contactInfoJSONString = JSON.serialize(contactInfoWrapperList);
        
        System.debug('JSONString --->'+contactInfoJSONString);
        
        RestContext.response.responseBody = Blob.valueOf(contactInfoJSONString);

    }
}