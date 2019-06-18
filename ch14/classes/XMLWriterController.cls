public with sharing class XMLWriterController{

    public static String getXMLContent() {
         
         XMLStreamWriter xmlStreamWriterObj = new Xmlstreamwriter();
         xmlStreamWriterObj.writeStartDocument(null,'1.0');
         xmlStreamWriterObj.writeStartElement(null,'AccountService', null);
         xmlStreamWriterObj.writeAttribute(null,null,'version','1.0');
         xmlStreamWriterObj.writeComment('Account Details');
         xmlStreamWriterObj.writeStartElement(null,'Account',null);
         xmlStreamWriterObj.writeAttribute(null,null,'name','Edge Communications');
         xmlStreamWriterObj.writeStartElement(null,'FIELDS',null);
         xmlStreamWriterObj.writeStartElement(null,'Type',null);
         xmlStreamWriterObj.writeCharacters('Customer - Direct');         
         xmlStreamWriterObj.writeEndElement(); 
         xmlStreamWriterObj.writeStartElement(null,'Industry',null);
         xmlStreamWriterObj.writeCharacters('Electronics');
         xmlStreamWriterObj.writeEndElement(); 
         xmlStreamWriterObj.writeEndElement(); 
         xmlStreamWriterObj.writeEndElement(); 
         xmlStreamWriterObj.writeEndElement(); 
         xmlStreamWriterObj.writeEndDocument(); 

         String generatedXMLString= xmlStreamWriterObj.getXmlString();
         xmlStreamWriterObj.close();

         return generatedXMLString;
   }
}