public with sharing class ContactsDataTableController {
    
    @AuraEnabled
    public static ContactsWrapper getContacts(String accountId)
    {
        return new ContactsWrapper(ContactsSelector.newInstance().selectByAccountId(accountId));
    }

    public class ContactsWrapper
    {
        @AuraEnabled
        public List<ContactWrapper> contacts {get; private set;}

        public ContactsWrapper(List<Contact> records)
        {
            this.contacts = new List<ContactWrapper>();
            for (Contact record : records)
            {
                this.contacts.add(new ContactWrapper(record));
            }
        }
    }

    public class ContactWrapper
    {
        @AuraEnabled public String id {get; set;}
        @AuraEnabled public String name {get; set;}
        @AuraEnabled public String phone {get; set;}

        public ContactWrapper(Contact record)
        {
            this.id = String.valueOf(record.Id);
            this.name = record.Name != null ? record.name : '';
            this.phone = record.phone != null ? record.phone : '';
        }

    }
        
}
