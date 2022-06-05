import {
    LightningElement,
    wire,
    track
} from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';


export default class Videodemo extends LightningElement {

    @track
    label = 'Hello Local Dev'

    @wire(getAccountList) accountList

}