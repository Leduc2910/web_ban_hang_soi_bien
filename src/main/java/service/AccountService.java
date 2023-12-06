package service;

import model.Account;
import service.IService.IAccountService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountService implements IAccountService<Account> {
    Connection connection = ConnectToMySQL.getConnection();

    public Account getAccount(String phoneNumber, String password) {
        for (Account a : findAll()) {
            if (a.getPhoneNumber().equals(phoneNumber) && a.getPassword().equals(password)) {
                return a;
            }
        }
        return null;
    }

    public boolean checkAccount(String phoneNumber, String password) {
        for (Account a : findAll()) {
            if (a.getPhoneNumber().equals(phoneNumber) && a.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void add(Account account) {
        List<Account> accounts = findAll();
        String sql = "insert into user(phoneNumber, password, fullName) values (?,?,?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getPhoneNumber());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setString(3, account.getFullName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void edit(int id, Account account) {
        String sql = "update user set phoneNumber = ?, password = ?, role = ?, fullName = ? where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getPhoneNumber());
            preparedStatement.setString(2, account.getPassword());
            preparedStatement.setInt(3, account.getRole());
            preparedStatement.setString(4, account.getFullName());
            preparedStatement.setInt(5, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public void delete(int id) {
        String sql = "delete from user where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Account> findAll() {
        String sql = "select * from user;";
        List<Account> accountList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String phoneNumber = resultSet.getString("phoneNumber");
                String passWord = resultSet.getString("passWord");
                int role = resultSet.getInt("role");
                String fullName = resultSet.getString("fullName");
                Account account = new Account(id, phoneNumber, passWord, role, fullName);
                accountList.add(account);
            }

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }


        return accountList;
    }
}
