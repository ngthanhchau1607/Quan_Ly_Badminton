package dao.Account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBconnection;
import entity.Account;


public class DaoAccount implements IDaoAccount {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    @Override
    public List<Account> findAll() {
        List<Account> list = new ArrayList<Account>();
        String sql = "select * from Account";
        try{
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setFullname(rs.getString("fullname"));
                account.setEmail(rs.getString("email"));
                account.setDate_of_birth(rs.getDate("date_of_birth"));
                account.setRole(rs.getInt("role"));
                list.add(account);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void delete(int account_id) {
        String sql = "delete from Account where account_id=? ";
        try{
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,account_id) ;
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insert(Account account) {
        String sql = "INSERT INTO Account (username, password, fullname, email, date_of_birth, role) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ps.setString(3, account.getFullname());
            ps.setString(4, account.getEmail());
            ps.setDate(5, new java.sql.Date(account.getDate_of_birth().getTime()));
            ps.setInt(6, account.getRole());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Account getAccountbyID(int account_id) {
        String sql = "select * from Account where account_id=? ";
        Account account = new Account();
        try{
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,account_id) ;
            rs = ps.executeQuery();
            while(rs.next()){
                account.setAccount_id(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setFullname(rs.getString("fullname"));
                account.setEmail(rs.getString("email"));
                account.setDate_of_birth(rs.getDate("date_of_birth"));
                account.setRole(rs.getInt("role"));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }

    @Override
    public Account login(String username, String password) {
        String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
        Account account = null;
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                account = new Account();
                account.setAccount_id(rs.getInt("account_id"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setFullname(rs.getString("fullname"));
                account.setEmail(rs.getString("email"));
                account.setDate_of_birth(rs.getDate("date_of_birth"));
                account.setRole(rs.getInt("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return account;
    }
}