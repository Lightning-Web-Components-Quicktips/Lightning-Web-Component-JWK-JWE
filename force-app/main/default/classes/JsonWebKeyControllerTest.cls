@isTest
public with sharing class JsonWebKeyControllerTest {
    
    @isTest
    static void testDeserializedWebKey() {
        Test.startTest();

        JsonWebKey webKey = JSONWebKeyController.loadJsonWebKey();

        Test.stopTest();
    } 
}
