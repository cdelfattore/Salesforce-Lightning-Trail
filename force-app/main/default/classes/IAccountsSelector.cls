public interface IAccountsSelector
{
    List<Account> selectById(Set<Id> idSet);
}
