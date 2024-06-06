package service.Account;

import entity.Account;

import java.util.List;

public interface IServiceAccount {
    List<Account> findAll();
    void delete(int account_id);
    void insert(Account account);
    Account getAccountbyID(int account_id);
    Account login (String username, String password);
}
