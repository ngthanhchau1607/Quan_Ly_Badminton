package entity;

import java.sql.Date;

public class Invoice {
    private int mahd;
    private int account_id;
    private double price;
    private Date dateXuat;
    private String username; // Thêm thuộc tính này

    // Constructors, getters, and setters

    public Invoice() {}

    public Invoice(int mahd, int account_id, double price, Date dateXuat, String username) {
        this.mahd = mahd;
        this.account_id = account_id;
        this.price = price;
        this.dateXuat = dateXuat;
        this.username = username;
    }

    // getters and setters

    public int getMahd() {
        return mahd;
    }

    public void setMahd(int mahd) {
        this.mahd = mahd;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDateXuat() {
        return dateXuat;
    }

    public void setDateXuat(Date dateXuat) {
        this.dateXuat = dateXuat;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
