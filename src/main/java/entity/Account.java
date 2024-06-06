package entity;

import java.util.Date;

public class Account {
    private int account_id;
    private String username;
    private String password;
    private String fullname;
    private String email;
    private Date date_of_birth;
    private int role;

    // Constructors
    public Account() {
    }

    public Account(int account_id, String username, String password, String fullname, String email, Date date_of_birth, int role) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.date_of_birth = date_of_birth;
        this.role = role;
    }

    // Getters and Setters
    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
    @Override
    public String toString() {
        return "Account{" +
                "account_id=" + account_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", fullname='" + fullname + '\'' +
                ", image='" + email + '\'' +
                ", date_of_birth=" + date_of_birth +
                ", role=" + role +
                '}';
    }
}
