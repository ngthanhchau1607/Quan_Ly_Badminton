package service.Account;

import dao.Account.DaoAccount;
import dao.Account.IDaoAccount;
import entity.Account;
import service.Account.IServiceAccount;

import java.util.List;

public class ServiceAccount implements IServiceAccount {
    IDaoAccount daoAccount = new DaoAccount();
    @Override
    public List<Account> findAll() {
        return  daoAccount.findAll();
    }

    @Override
    public void delete(int account_id) {
        daoAccount.delete(account_id);
    }

    @Override
    public void insert(Account account) {
        daoAccount.insert(account);
    }

    @Override
    public Account getAccountbyID(int account_id) {
        return daoAccount.getAccountbyID(account_id);
    }

    @Override
    public Account login(String username, String password) {
        return daoAccount.login(username,password);
    }
}
