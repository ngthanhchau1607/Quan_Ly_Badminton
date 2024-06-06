package dao.Product;

import connection.DBconnection;
import entity.Account;
import entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoProduct implements IDaoProduct {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    @Override
    public List<Product> listAll() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listLimited(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP " + limit + " * FROM Product;";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public List<Product> searchProduct(String query) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE name LIKE ?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + query + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> last4Product() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product\r\n"
                + "where cateID = 2\r\n"
                + "order by id desc";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> Next4ProductG(int amount) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where cateID=2\r\n"
                + "order by id desc\r\n"
                + "offset ? rows\r\n"       // Bỏ qua các sản phẩm đã hiển thị
                + "fetch next 4 rows only";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> last4ProductV() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 4 * from Product\r\n"
                + "where cateID = 1\r\n"
                + "order by id desc";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> Next4ProductV(int amount) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where cateID=1\r\n"
                + "order by id desc\r\n"
                + "offset ? rows\r\n"       // Bỏ qua các sản phẩm đã hiển thị
                + "fetch next 4 rows only";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    @Override
    public void delete(int id) {
        String sql = "delete from Product where id=? ";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void add(Product product) {
        String sql = "INSERT INTO Product (name, image, price, title, description, cateID, suppid, properties, image2, image3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getTitle());
            ps.setString(5, product.getDescription());
            ps.setInt(6, product.getCateID());
            ps.setInt(7, product.getSuppid());
            ps.setString(8, product.getProperties());
            ps.setString(9, product.getImage2());
            ps.setString(10, product.getImage3());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public Product getProductById(int id) {
        String sql = "SELECT * FROM Product WHERE id=?";
        Product product = null;
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Tạo một đối tượng Product và thiết lập các thuộc tính từ kết quả truy vấn
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public void updateProduct(Product product) {
        String sql = "UPDATE Product SET name=?, image=?, price=?, title=?, description=?, cateID=?, suppid=?, properties=?, image2=?, image3=? WHERE id=?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getTitle());
            ps.setString(5, product.getDescription());
            ps.setInt(6, product.getCateID());
            ps.setInt(7, product.getSuppid());
            ps.setString(8, product.getProperties());
            ps.setString(9, product.getImage2());
            ps.setString(10, product.getImage3());
            ps.setInt(11,product.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public int getCateIDByProductID(int id) {
        String sql = "select [cateID] from Product\r\n"
                + "where [id] =?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    @Override
    public int countAllProduct() {
        String sql = "select count(*) from Product";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    @Override
    public List<Product> listRelated(int cateid) {
        List<Product> list = new ArrayList<>();
        String sql = "select top 5 * from product\r\n"
                + "where [cateID] =?\r\n"
                + "order by id desc";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cateid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> getProductByIndex(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product \r\n"
                + "order by [id]\r\n"
                + "offset ? rows\r\n"
                + "fetch next 8 rows only";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,(index-1)*8);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchprice1() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where [price] >= 50.00 and [price]<=70.00";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchprice2() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where [price] >= 70.00 and [price]<=90.00";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchprice3() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where [price] >= 90.00 and [price]<=100.00";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchvot() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where cateID=1";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchgiay() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where cateID=2";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchao() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\r\n"
                + "where cateID=3";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Product> listsearchbyname(String txtsr) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where [name] like ?";
        try {
            conn = new DBconnection().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtsr + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setImage(rs.getString("image"));
                product.setPrice(rs.getDouble("price"));
                product.setTitle(rs.getString("title"));
                product.setDescription(rs.getString("description"));
                product.setCateID(rs.getInt("cateID"));
                product.setSuppid(rs.getInt("suppid"));
                product.setProperties(rs.getString("properties"));
                product.setImage2(rs.getString("image2"));
                product.setImage3(rs.getString("image3"));
                list.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
