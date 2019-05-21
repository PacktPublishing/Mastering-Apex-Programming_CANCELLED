public class CheckPointTraining {   
    
    public static void calculateNumberofContacts(){
        
        List<Contact> contactList = new List<Contact>();
    	Integer numberOfContacts = 0;
        
        contactList = [SELECT Id, Name, Title FROM Contact WHERE Account.Name LIKE '%United%'];
        
        if(contactList <> NULL && !contactLIst.isEmpty()){
            for(Contact con : contactList){
                if(con.Title != NULL)
                    numberOfContacts++;
            }
        }        
        
    }
}