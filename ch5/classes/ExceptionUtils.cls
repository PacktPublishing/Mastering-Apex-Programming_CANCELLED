/* 
    @name: ExceptionUtils
    @description: It uses common method to retrive error message from Custom Metadata Type.
    @author: Santanu Boral
    @date: 24 MAR 2019
    
    CopyRight (c) 2019  
*/
public class ExceptionUtils {
    
    //retrieve message from Custom Metadata Type based on key
    public static String getMessage(String msgKey) {
        try {
            Error_Message_MetaData__mdt cmt =  [SELECT Id, MasterLabel, Message__c 
                                            FROM Error_Message_MetaData__mdt
                                            WHERE MasterLabel=:msgKey];
            return cmt.Message__c;                              
        }catch (Exception ex) {
            throw new MyCustomException('Entry Not Found');
        }
    }
}