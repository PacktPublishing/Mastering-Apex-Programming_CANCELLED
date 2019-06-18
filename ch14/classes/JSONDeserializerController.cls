public Class JSONDeserializerController{

    public static String contactInfoJSONString;
    
    public static void doJSONDeserialization(){
    
    contactInfoJSONString = JSONSerializerController.doJSONSerialization();

    List<JSONSerializerController.ContactInfoWrapper> deSerializedcontactInfoWrapperList = 
          (List<JSONSerializerController.ContactInfoWrapper>)JSON.deserialize(contactInfoJSONString, List<JSONSerializerController.ContactInfoWrapper>.class);
        
        System.debug('deSerializedcontactInfoWrapperList--->'+deSerializedcontactInfoWrapperList);
        
        for (JSONSerializerController.ContactInfoWrapper deserializedcontactInfoWrapperObj :deSerializedcontactInfoWrapperList) {
        
            System.debug('Last Name--->'+deserializedcontactInfoWrapperObj.lastName);
        }

        
    }

}