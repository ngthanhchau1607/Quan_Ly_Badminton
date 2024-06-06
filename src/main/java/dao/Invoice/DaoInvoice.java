package dao.Invoice;

import connection.DBconnection;
import entity.Invoice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DaoInvoice implements IDaoInvoice{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    @Override
    public List<Invoice> listAll() {
        List<Invoice> list = new ArrayList<Invoice>();
        String sql = "SELECT i.mahd, i.account_id, i.price, i.dateXuat, a.username " +
                "FROM Invoice i " +
                "JOIN Account a ON i.account_id = a.account_id";
        try{
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Invoice invoice = new Invoice();
                invoice.setMahd(rs.getInt("mahd"));
                invoice.setAccount_id(rs.getInt("account_id"));
                invoice.setPrice(rs.getDouble("price"));
                invoice.setDateXuat(rs.getDate("dateXuat"));
                list.add(invoice);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void delete(int mahd) {
        String sql = "delete from Invoice where mahd=? ";
        try{
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,mahd) ;
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Invoice> findByDate(Date date) {
        List<Invoice> list = new ArrayList<Invoice>();
        String sql = "SELECT i.mahd, i.account_id, i.price, i.dateXuat, a.username " +
                "FROM Invoice i " +
                "JOIN Account a ON i.account_id = a.account_id " +
                "WHERE i.dateXuat = ?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setDate(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                Invoice invoice = new Invoice();
                invoice.setMahd(rs.getInt("mahd"));
                invoice.setAccount_id(rs.getInt("account_id"));
                invoice.setPrice(rs.getDouble("price"));
                invoice.setDateXuat(rs.getDate("dateXuat"));
                invoice.setUsername(rs.getString("username"));
                list.add(invoice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
