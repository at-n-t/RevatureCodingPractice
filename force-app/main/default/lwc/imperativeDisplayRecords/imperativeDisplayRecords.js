import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountHelper.getAccounts';

export default class ImperativeDisplayRecords extends LightningElement {
    
    accountResult;

    handleSearch() {
        let s = this.template.querySelector('.input').value;
        getAccounts({ search : s})
        .then(result => {
            this.accountResult = result;
        })
        .catch(error => {
            console.log(error);
        });
    }
}
