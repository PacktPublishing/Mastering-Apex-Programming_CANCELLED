public class XMLReaderController{
    
    public static void readXMLContent(){
        XmlStreamReader xmlStreamReaderObj = new XmlStreamReader(XMLWriterController.getXMLContent());
        
        while(xmlStreamReaderObj.hasNext()) { 
            if (xmlStreamReaderObj.getEventType() == XmlTag.START_ELEMENT) {
                if ('Account' == xmlStreamReaderObj.getLocalName()) {
                    System.debug('Account Name--->'+ xmlStreamReaderObj.getAttributeValue(null, 'name'));
                }
            }
            xmlStreamReaderObj.next();
        }
    }
}