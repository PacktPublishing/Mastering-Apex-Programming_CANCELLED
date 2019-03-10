/**
    * @name:        ShowContactsController 
    * @author:      Santanu Pal   
    * @date:        2 JAN 2019
    * @description: This Apex Class is used to return Contact records to the Lightning Component.
    
    CopyRight (c) 2019
**/

public class ShowContactsController {
     
    @AuraEnabled
    public static List<Contact> getContactRecords(String accountName){
        
        List<Contact> contactList = new List<Contact>();
        
        String searchedAccountName = '%'+accountName+'%';
        
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