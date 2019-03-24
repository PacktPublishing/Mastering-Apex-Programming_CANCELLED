/**
    * @name:        ShowContactsController_NonVulnerable 
    * @author:      Santanu Pal   
    * @date:        3 JAN 2019
    * @description: This Apex Class is used to return Contact records to the Lightning Component.
    
    CopyRight (c) 2019
**/

public class ShowContactsController_NonVulnerable {
     
    @AuraEnabled
    public static List<Contact> getContactRecords(String accountName){
        
       List<Contact> contactList = new List<Contact>();
        
        String searchedAccountName = '%'+accountName+'%';
        
        String [] contactFields = new String []{'Id',
                                                'Name',
                                                'AccountId',
                                                'Email',
                                                'MobilePhone',
                                                'LastModifiedDate'};
        
        Map<String,Schema.SObjectField> contactSchema = Schema.SObjectType.Contact.fields.getMap();
        
        for(String conFieldtoCheck : contactFields){
            
            //check logged-in user's access to the particular field
            if (!contactSchema.get(conFieldtoCheck).getDescribe().isAccessible()) {
            
                //send error message to client/Lightning Aura Component
                //throw new System.NoAccessException();
                throw new AuraHandledException('No access on '+conFieldtoCheck+' field');
            }
        }
        
        if(accountName == NULL)
            contactList = [SELECT Id, Name, Account.Name, Email, MobilePhone, LastModifiedDate FROM Contact WHERE AccountId <> NULL ORDER BY LastModifiedDate Desc LIMIT 20];
        else
            contactList = [SELECT Id, Name, Account.Name, Email, MobilePhone, LastModifiedDate FROM Contact WHERE Account.Name like :searchedAccountName ORDER BY LastModifiedDate Desc LIMIT 20];
        
        if(contactList <> NULL && contactList.size()>0)
            return contactList;
        else
            return NULL;
    }
 
}