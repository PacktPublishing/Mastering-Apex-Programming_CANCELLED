/*
    @name: Utility
    @description: This class provides methods to prepare and send emails
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
public class Utility {
    
    public static List<Messaging.SingleEmailMessage> lstEmail = 
                    new List<Messaging.SingleEmailMessage>();
    
    //prepare email with arguments passed
    public static void prepareEmail(String recepient, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {recepient};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body); 
        lstEmail.add(mail);
    }
    
    //send email based on above list of SingleEmailMessage
    public static void sendEmail(){
        Messaging.SendEmailResult[] results = Messaging.sendEmail(lstEmail);
        lstEmail = new List<Messaging.SingleEmailMessage>();
    }   
}