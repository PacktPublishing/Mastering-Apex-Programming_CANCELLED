public with sharing class CSVGeneratorController {

    List<String> contentRowList = new List<String>();
    String columnHeader;
    String contentRowString;
    
    public String getContactCSVFile(){
    
    List<Contact> contactList = [SELECT LastName, MobilePhone FROM Contact LIMIT 3];
    
    if(contactList<>NULL && !contactList.isEmpty()){
        for(Contact con : contactList){        
            contentRowString = con.LastName+ ',' + con.MobilePhone;
            contentRowList.add(contentRowString);
        }
    }
    columnHeader = 'LastName,MobilePhone\n';
    return (columnHeader + String.join(contentRowList,'\n'));
    }    
}