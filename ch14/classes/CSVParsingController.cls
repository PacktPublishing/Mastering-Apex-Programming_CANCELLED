public with sharing class CSVParsingController {
    
    public Blob contactCSVFile{get;set;}
    public String contactCSVString{get;set;}
    public List<String> contentRowList{get;set;}
    public List<Contact>contactList{get;set;}
    
    public List<String> recordList = new List<String>();
    Contact contactObj = new Contact();
  
    public CSVParsingController(){
          contentRowList = new List<String>();
          contactList = new List<Contact>();
    }
  
    public void importContactCSVFile(){
         contactCSVString = contactCSVFile.toString();             
         contentRowList = contactCSVString.split('\n'); 
             
         for(Integer count=1; count <contentRowList.size(); count++){
           contactObj = new Contact();
           recordList = contentRowList[count].split(',');
           contactObj.LastName = recordList[0];
           contactObj.MobilePhone = recordList[1];
           
           contactList.add(contactObj);
         }
   }
  
   public void saveContact(){   
       try{
           if(contactList<>NULL && !contactList.isEmpty()){
                   insert contactList;
            }
       }catch (Exception ex){        
                ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,ex.getMessage());
                ApexPages.addMessage(errorMessage);
        } 
   }  
}