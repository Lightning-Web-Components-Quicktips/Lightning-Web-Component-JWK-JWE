/**
 * jweEncrypter
 * 
 * LWC Component POC to Encrypt  Strings using JWE with a Json Web Key (JWK)
 * Leverages JsJose JavaScript Library  (https://github.com/square/js-jose) and a 
 * simple Apex Class to return a JWK (JSON Web Key)
 * 
 * jordan.baucke@gmail.com 
 * 

 */
import { LightningElement } from "lwc";
import { loadScript } from "lightning/platformResourceLoader";
import loadJsonWebKey from "@salesforce/apex/JsonWebKeyController.loadJsonWebKey";

// JS-JOSE https://github.com/square/js-jose - v0.2.2
import JsJose from "@salesforce/resourceUrl/JsJose";

export default class JweEncrypter extends LightningElement {
  jsJoseInitialized = false;
  encrypterReady = false;
  encrypter;

  stringToEncrypt = "";
  encryptedString = "";

  /**
   *
   * @returns
   */
  renderedCallback() {
    if (this.jsJoseInitialized) {
      return;
    }
    this.jsJoseInitialized = true;
    loadScript(this, JsJose + "/jose.js")
      .then(() => {
        console.info(">>> JsJose successfully loaded");
        // load the key
        if (!this.encrypterReady) {
          loadJsonWebKey()
            .then((result) => {
              console.info(
                ">>> Loaded a JSON Web Key: " + JSON.stringify(result)
              );

              this.key = JSON.parse(result);
              var cryptographer = new Jose.WebCryptographer();
              cryptographer.setKeyEncryptionAlgorithm("RSA-OAEP-256");

              Jose.Utils.importRsaPublicKey(this.key, "RSA-OAEP-256").then(
                (result) => {
                  this.encrypter = new Jose.JoseJWE.Encrypter(
                    cryptographer,
                    result
                  );
                  this.encrypterReady = true;
                }
              );
            })
            .catch((error) => {
              console.error(error);
              this.key = undefined;
            });
        }
      })
      .catch((e) => {
        console.error(">>> Error loading JsJose");
      });
  }

  /**
   *
   */
  get disableEncryptBtn() {
    return (
      this.encrypterReady &&
      (this.stringToEncrypt === undefined || this.stringToEncrypt === "")
    );
  }

  /**
   *
   * @param {*} evt
   */
  handleStringToEncryptChanged(evt) {
    this.stringToEncrypt = evt.target.value;
    if (this.encryptedString !== "") {
      this.encryptedString = "";
    }
  }

  /**
   *
   */
  encryptStringWithJwe() {
    this.encrypter.encrypt(this.stringToEncrypt).then((result) => {
      this.encryptedString = result;
      console.info(
        "Encrypted string: " +
          this.stringToEncrypt +
          " to: " +
          this.encryptedString
      );
    });
  }
}
