import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountHelper.getAccounts';

export default class DisplayRecords extends LightningElement {

    inputSearch;
    accountResult;

    @wire(getAccounts, { search : '$inputSearch'})
    accountResult;

    columns = [
        { label: 'Name', fieldName: 'Name', type: 'name' }
    ]

    handleSearch() {
        let s = this.template.querySelector('.input').value;
        this.accountResult = s;
    }
}