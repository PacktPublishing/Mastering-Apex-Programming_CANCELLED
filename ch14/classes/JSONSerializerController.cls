public Class JSONSerializerController{

    public static String contactInfoJSONString;
    
    public class ContactInfoWrapper{
        public String firstName;
        public String lastName;
        public String title;
        public String mobilePhone;      
        
        
        public ContactInfoWrapper(String firstName, String lastName, String title, String mobilePhone)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.title = title;
            this.mobilePhone = mobilePhone;
        }       
    }
    
    public static String doJSONSerialization(){
    
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
        
        return contactInfoJSONString;

    }
}