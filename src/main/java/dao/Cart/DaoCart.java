package dao.Cart;

import connection.DBconnection;
import entity.Account;
import entity.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCart implements IDaoCart{
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    @Override
    public List<Cart> getCartByAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT * FROM Cart WHERE accountID = ?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setAccountID(rs.getInt("accountID"));
                cart.setProductID(rs.getInt("productID"));
                cart.setAmount(rs.getInt("amount"));
                cart.setMaCart(rs.getInt("maCart"));
                list.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Đóng các kết nối và tài nguyên
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void editAmountCart(int accountID, int productID, int amount) {
        String sql = "update Cart set [amount]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
