//In session settings, disable secure and consistent browser caching while developing
//Ensure debug mode is enabled in order to debug using chrome dev tools.
import { api, LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/ContactsDataTableController.getContacts';

const actions = [
    { label: 'Edit', name: 'edit' }
];

const columns = [
    { label: 'Name', fieldName: 'name'},
    { label: 'Phone', fieldName: 'phone'},
    { type: 'action', typeAttributes: { rowActions : actions } }
];

export default class ContactsDataTable extends LightningElement
{
    @api recordId;
    isLoading = false;
    columns = columns;
    contacts = [];

    /**
     * The connectedCallback() event should only fire once once.
     * When the component finishes loading.
     */
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

    handleRowAction(event)
    {
        //to get information about the action selected use
        let action = event.detail.action.name;

        //to create a JSON object of the row use.
        //Couldn't find a better way to do this but one may exist.
        let rowData = JSON.parse(JSON.stringify(event.detail.row));
        debugger;
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
