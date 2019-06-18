public class JSONParserUtil {

    public static String jsonString{get;set;}
    
    @future(callout=true)
    public static void parseJSONResponse() {        
        Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://spdev-developer-edition.na85.force.com/ApexDev/services/apexrest/JSONRestService';
        request.setEndPoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = httpProtocol.send(request);
        
        System.debug('response--->'+response.getBody());
        
        jsonString = response.getBody();
          
        JSONParser parser = JSON.createParser(response.getBody());         
        
        while (parser.nextToken() != null) {      
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME) {
                parser.nextValue();
                if(parser.getCurrentName() == 'lastName') {
                     System.debug('parser--->'+parser.getText());
                }
            }
        }        
    }   
}