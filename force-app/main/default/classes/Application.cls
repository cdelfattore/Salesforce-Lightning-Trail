public class Application
{
    // Configure and create the UnitOfWorkFactory for this Application
	public static final fflib_Application.UnitOfWorkFactory UnitOfWork = 
        new fflib_Application.UnitOfWorkFactory(
                new List<SObjectType> {
                    Account.SObjectType
                }
            );
    
    // Configure and create the SelectorFactory for this Application
	public static final fflib_Application.SelectorFactory Selector = 
        new fflib_Application.SelectorFactory(
            new Map<SObjectType, Type> {
                Account.SObjectType => AccountsSelector.class,
                Contact.SObjectType => ContactsSelector.class
            }
        );
}
