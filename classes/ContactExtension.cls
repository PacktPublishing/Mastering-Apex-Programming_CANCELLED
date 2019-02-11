/**
    * @name: ContactExtension
    * @author: Santanu Pal 
    * @date: 2 JAN 2019
    * @description: to capture and validate the Contact Phone Number
    
    CopyRight (c) 2019
**/

public class ContactExtension {

    public final Contact contactObj;
    
    public ContactExtension(ApexPages.StandardController controller) {
        this.contactObj = (Contact)controller.getRecord();
    }
    
    public pageReference save(){
        if(this.contactObj.Phone.length()>14)        
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Phone Number should not be greater than 14 digits'));
        else{
            try{
                update this.contactObj; 
                return new PageReference('/'+this.contactObj.Id);              
            }catch(DMLException ex){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage()));
            }        
        }
        
        return null;
   }

}