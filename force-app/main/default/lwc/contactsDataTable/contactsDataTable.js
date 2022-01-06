import { api, LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/ContactsDataTableController.getContacts';

const actions = [
    { label: 'Edit', name: 'edit' }
];

const columns = [
    { label: 'Name', fieldName: 'name'},
    { label: 'Phone', fieldName: 'phone'},
    { 
        type: 'action',
        typeAttribute: {
            rowActions : actions
        }
    }
];

export default class ContactsDataTable extends LightningElement
{
    @api recordId;
    isLoading = false;
    columns = columns;
    contacts = [];

    connectedCallback()
    {
        this.loadContactsTable();
    }

    /**
     * Call an apex method imperitavely 
     */
    loadContactsTable()
    {
        this.loading();
        getContacts({accountId : this.recordId})
            .then(result => {
                this.contacts = result.contacts;
            })
            .catch(error => {
                debugger;
            })
            .finally(() => {
                this.notLoading();
            })
    }

    loading()
    {
        this.isLoading = true;
    }

    notLoading()
    {
        this.isLoading = false;
    }

}
