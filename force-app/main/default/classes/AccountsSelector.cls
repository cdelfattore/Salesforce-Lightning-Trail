public inherited sharing class AccountsSelector extends fflib_SObjectSelector
    implements IAccountsSelector
{

    public static IAccountsSelector newInstance()
	{
		return (IAccountsSelector) Application.Selector.newInstance(Account.SObjectType);
	}

    public List<Schema.SObjectField> getSObjectFieldList()
    {
        return new List<Schema.SObjectField> {
            Account.Id,
            Account.Name,
            Account.Description
        };
    }

    public Schema.SObjectType getSObjectType()
	{
		return Account.SObjectType;
	}

    public List<Account> selectById(Set<Id> idSet)
	{
		return (List<Account>) selectSObjectsById(idSet);
	}
    
}
