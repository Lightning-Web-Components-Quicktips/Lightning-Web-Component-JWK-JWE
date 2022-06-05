# Lightning Web Component JWE Encryption

Simple POC for encrypting strings using JWE with a JWK using [JS-JOSE](https://github.com/square/js-jose)

![](https://github.com/Lightning-Web-Components-Quicktips/Lightning-Web-Component-JWK-JWE/demo.gif)

Salesforce APEX *does not necessarily support necessary cryptographic functions* (?) to derivate JWKs from other types of Cryptographic Keys, though it maybe possible
to store them in an Java Key-store (which is Supported by Salesforce) However, some APIs require that values be encrypted *before* they are sent to the server, or additionally this code could make it possible to store String-data at-rest in Salesforce in such a way that only someone with access to a private-key could read it.  

For this demo I simply generated an SSH RSA Private/Public Key-pair in Java and output as a JWK:

Example Java for Generating a JWK, you may need [Nimbus JOSE+JWT](https://connect2id.com/products/nimbus-jose-jwt)

```
// generate a new keypair
KeyPairGenerator rsaGen = KeyPairGenerator.getInstance("RSA");
rsaGen.initialize(2048);
KeyPair rsaKeyPair = rsaGen.generateKeyPair();

// get the public key (we can't decrypt data without the private-key but for this demo we assume this key is stored elsewhere) 
RSAPublicKey rsaPublicKey = (RSAPublicKey)rsaKeyPair.getPublic();
RSAKey jwk = new RSAKey.Builder(rsaPublicKey).build();

// print it as a JSON string for use in our demo
System.out.println(jwk.toJSONString());

```

- Note: this will generate a new key-pair that is not saved anywhere, for an example of generating them as files and reading into Java to create a JWKS (Java Webkey Server) checkout this [Stack Overflow question](https://stackoverflow.com/questions/11410770/load-rsa-public-key-from-file#)
