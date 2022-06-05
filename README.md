# Lightning Web Component JWE Encryption

Simple POC for encrypting strings using JWE with a JWK

Salesforce APEX does not necessarily support necessary cryptographic functions to derivate JWKs from other types of Cryptographic Keys, though it maybe possible
to store them in an Java Key-store (which is Supported by Salesforce) ?

For this demo I simply generated an SSH RSA Private/Public Key-pair in Java and output as a JWK :

Example Java for Generating a JWK, you will need (Nimbus JOSE+JWT)[https://connect2id.com/products/nimbus-jose-jwt]

```
KeyPairGenerator rsaGen = KeyPairGenerator.getInstance("RSA");
rsaGen.initialize(2048);
KeyPair rsaKeyPair = rsaGen.generateKeyPair();

RSAPublicKey rsaPublicKey = (RSAPublicKey)rsaKeyPair.getPublic();
RSAKey jwk = new RSAKey.Builder(rsaPublicKey).build();

System.out.println(jwk.toJSONString());

```

- Note: this will generate a new key-pair that is not saved anywhere, for an example of generating them as files and reading into Java to create a JWKS (Java Webkey Server) checkout this [Stack Overflow question](https://stackoverflow.com/questions/11410770/load-rsa-public-key-from-file#)
