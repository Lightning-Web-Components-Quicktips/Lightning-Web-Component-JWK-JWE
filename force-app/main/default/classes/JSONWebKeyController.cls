/**
 * Load a JSON Web Key from a KeyServer/Store
 * https://tools.ietf.org/html/rfc7517
 */
public with sharing class JSONWebKeyController {
    
    private static final String EXAMPLE_KEY = '{"kty":"RSA","kid":"testKey","e":"AQAB","n":"zNQ4tiVAAsD1Zit0XFQtYK_tgu2M7T_-HVeWNGTsaNnTDmDZYmtQ-EJvkbYNn8DQWI7ePAbeoMxOJdE9HhB_7fRvYcWAt2hZIMSvvtPjWZ5q4gjG75oOschYOWtu7oAlstwPnG6dqvrqwE7-5WHY9bQgokIpgIjfHHyUUPXKIwGqIpBWwOko77ihz9xYkHk9BY5JmSXOhW0F8CISPQzcfuDneiCrNFrInjBAt2UORPscNP2oeUdGR9TSFNp5VIzuFj6_LdZzUBbi96nyc0xVpH-U46Ck2gRQ-pGEXeE_J_5tLdeG-xdics17bCunuZG2YPXZJhRHW_zVtM9Blw5YPw"}';

    @AuraEnabled(cacheable=true)
    public static String loadJsonWebKey(){
        try {
            // load JSON Web Key - this is just an example - GENERATE YOUR OWN KEYS
            JsonWebKey jsonWebKey = new JsonWebKey();
            jsonWebKey = (JsonWebKey) JSON.deserialize(EXAMPLE_KEY, JsonWebKey.class);
            System.debug(jsonWebKey);
            return JSON.serialize(jsonWebKey, true);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
