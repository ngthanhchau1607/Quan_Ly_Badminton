package service.Product;

import entity.Product;

import java.util.List;

public interface IServiceProduct {
    List<Product> listAll();
    List<Product> listLimited(int limit);
    List<Product> searchProduct(String query);
    List<Product> last4Product();
    List<Product> Next4ProductG(int amount);
    List<Product> last4ProductV();
    List<Product> Next4ProductV(int amount);
    void delete(int id);
    void add(Product product);
    Product getProductById(int id);
    void updateProduct (Product product);
    int getCateIDByProductID (int id);
    int countAllProduct();
    List<Product> listRelated(int cateid);
    List<Product> getProductByIndex(int index);
    List<Product> listsearchprice1();
    List<Product> listsearchprice2();
    List<Product> listsearchprice3();
    List<Product> listsearchvot();
    List<Product> listsearchgiay();
    List<Product> listsearchao();
    List<Product> listsearchbyname(String txtsr);
}
