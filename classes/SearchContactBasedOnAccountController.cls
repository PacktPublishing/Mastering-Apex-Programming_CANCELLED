public with sharing class SearchContactBasedOnAccountController {

    public String searchKey{get;set;}
    public List<Contact> contactList{get;set;}
    
     public void doSearch(){    
        try{
            String queryString = 'SELECT Id, Name, Title, Phone, Email,Rank__c FROM Contact WHERE Account.Name LIKE \'%'+searchKey.replaceAll('\\s+', '')+'%\' ';
            System.debug('query--->'+queryString);
            contactList = Database.query(queryString); 
            System.debug(LoggingLevel.Finer, 'Contact List---->'+contactList); 
        }catch(Exception ex){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.error,ex.getMessage()));
        }
    }
}