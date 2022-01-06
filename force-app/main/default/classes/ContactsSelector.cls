public class ContactsSelector extends fflib_SObjectSelector
    implements IContactsSelector
{
    public static IContactsSelector newInstance()
	{
		return (IContactsSelector) Application.Selector.newInstance(Contact.SObjectType);
	}

    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField> {
            Contact.Email,
            Contact.Id,
            Contact.MailingCity,
            Contact.MailingPostalCode,
            Contact.MailingStreet,
            Contact.Name,
            Contact.Phone
        };
    }

    public Schema.SObjectType getSObjectType()
	{
		return Contact.SObjectType;
	}

    public List<Contact> selectByAccountId(Id accountId)
	{
		return (List<Contact>) Database.query(
            newQueryFactory()
                .setCondition('AccountId = :accountId')   
                .toSOQL()
        );
	}
}
