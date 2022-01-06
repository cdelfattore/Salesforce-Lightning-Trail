public interface IContactsSelector extends fflib_ISObjectSelector
{
    List<Contact> selectByAccountId(Id accountId);    
}
