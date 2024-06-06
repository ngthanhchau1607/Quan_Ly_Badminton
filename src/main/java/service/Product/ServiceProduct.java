package service.Product;

import dao.Product.DaoProduct;
import dao.Product.IDaoProduct;
import entity.Product;

import java.util.List;

public class ServiceProduct implements IServiceProduct{
    IDaoProduct daoProduct = new DaoProduct();

    @Override
    public List<Product> listAll() {
        return daoProduct.listAll();
    }

    @Override
    public List<Product> listLimited(int limit) {
        return daoProduct.listLimited(limit);
    }

    @Override
    public List<Product> searchProduct(String query) {
        return daoProduct.searchProduct(query);
    }

    @Override
    public List<Product> last4Product() {
        return daoProduct.last4Product();
    }

    @Override
    public List<Product> Next4ProductG(int amount) {
        return daoProduct.Next4ProductG(amount);
    }

    @Override
    public List<Product> last4ProductV() {
        return daoProduct.last4ProductV();
    }

    @Override
    public List<Product> Next4ProductV(int amount) {
        return daoProduct.Next4ProductV(amount);
    }

    @Override
    public void delete(int id) {
        daoProduct.delete(id);
    }

    @Override
    public void add(Product product) {
        daoProduct.add(product);
    }

    @Override
    public Product getProductById(int id) {
        return daoProduct.getProductById(id);
    }

    @Override
    public void updateProduct(Product product) {
        daoProduct.updateProduct(product);
    }

    @Override
    public int getCateIDByProductID(int id) {
        return daoProduct.getCateIDByProductID(id);
    }

    @Override
    public int countAllProduct() {
        return daoProduct.countAllProduct();
    }

    @Override
    public List<Product> listRelated(int cateid) {
        return daoProduct.listRelated(cateid);
    }

    @Override
    public List<Product> getProductByIndex(int index) {
        return daoProduct.getProductByIndex(index);
    }

    @Override
    public List<Product> listsearchprice1() {
        return daoProduct.listsearchprice1();
    }

    @Override
    public List<Product> listsearchprice2() {
        return daoProduct.listsearchprice2();
    }
    @Override
    public List<Product> listsearchprice3() {
        return daoProduct.listsearchprice3();
    }

    @Override
    public List<Product> listsearchvot() {
        return daoProduct.listsearchvot();
    }

    @Override
    public List<Product> listsearchgiay() {
        return daoProduct.listsearchgiay();
    }

    @Override
    public List<Product> listsearchao() {
        return daoProduct.listsearchao();
    }

    @Override
    public List<Product> listsearchbyname(String txtsr) {
        return daoProduct.listsearchbyname(txtsr);
    }

}
