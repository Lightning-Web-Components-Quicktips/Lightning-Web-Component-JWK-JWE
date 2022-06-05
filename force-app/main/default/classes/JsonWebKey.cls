/**
 * A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data
 * structure that represents a cryptographic key.  This specification
 * also defines a JWK Set JSON data structure that represents a set of
 * JWKs.  Cryptographic algorithms and identifiers for use with this
 * specification are described in the separate JSON Web Algorithms (JWA)
 * specification and IANA registries established by that specification.
 *
 * https://datatracker.ietf.org/doc/html/rfc7517
 * 
 * [6-5-22] JSON Web Key representation of an RSA Key (Public or Private)
 *          The Private Key should be kept securely on the server - and the Public
 *          Key portion sent to the browser for encrypting messages or verifying
 *          signatures.
 *          
 *          Generating and storing keys is beyond the scope here, but generally
 *          a remote web-service can be used to return the latest JSON Web Key 
 *          for use in encrypting messages before they are sent
 */
public with sharing class JsonWebKey {

    public String kty;

    public String kid;

    public String use;

    public String n;

    public String e;

    public String d;

    public String p; 

    public String q;

    public String dp;

    public String dq;

    public String qi;
}
