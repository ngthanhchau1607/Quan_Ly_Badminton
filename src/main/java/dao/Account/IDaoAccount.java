package dao.Account;

import java.util.List;

import entity.Account;

public interface IDaoAccount {
    List<Account> findAll();
    void delete(int account_id);
    void insert(Account account);
    Account getAccountbyID(int account_id);
    Account login (String username, String password);

}
