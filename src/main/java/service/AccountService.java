package service;

import model.Account;
import service.IService.IAccountService;

import java.util.List;

public class AccountService implements IAccountService<Account> {

    @Override
    public void checkAccount(Account account) {
    }

    @Override
    public void edit(int id, Account account) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Account> findAll() {
        return null;
    }
}
